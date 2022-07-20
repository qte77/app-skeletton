#https://github.com/harvardnlp/annotated-transformer/blob/master/Makefile
#https://makefiletutorial.com/
#https://devhints.io/makefile

HASH != git rev-parse --short HEAD
IMG_BASE := ml-baseimage:$(HASH)
IMG_USECASE := ml-usecase:$(HASH)
IMG_USECASE_LOCAL := localhost:5000/$(IMG_USECASE)
DOCKERFILE := ./Dockerfile
APP_PATH := ./app
APP_MAIN := $(APP_PATH)/app.py
APP_PIPFILE := $(APP_PATH)/Pipfile
KUBE := ./kubernetes/overlays
KUBE_PROD := $(KUBE)/prod
KUBE_TEST := $(KUBE)/test
IPYNB := $(APP:$(APP_PATH)=$(APP_PATH)/ipynb,.py=.ipynb)
PAPER_CFG := $(APP_PATH)/config/papermill-parameters.yml
HELP := $(APP_PATH)/README.md

py_to_nb: $(APP)
	jupytext --to ipynb $(APP)

nb_to_py: $(IPYNB)
	jupytext --to py:percent $(IPYNB)

exec_py: $(APP)
	python -m $(APP)

exec_ipynb: $(IPYNB)
	papermill $(IPYNB) -f $(PAPER_CFG)

py_to_html: $(IPYNB)
	jupytext --execute --to ipynb $(APP)
	jupyter nbconvert --to html $(IPYNB)

# nb_to_md: $(IPYNB)
# 	jupyter nbconvert --to markdown --execute $(IPYNB)

# blog: nb_to_md
# 	pandoc docs/header-includes.yaml the_annotated_transformer.md \
# 		--katex=/usr/local/lib/node_modules/katex/dist/ \
# 		--output=docs/index.html --to=html5 \
# 		--css=docs/github.min.css \
# 		--css=docs/tufte.css \
# 		--no-highlight --self-contained \
# 		--metadata pagetitle="The Annotated Transformer" \
# 		--resource-path=/home/srush/Projects/annotated-transformer/ \
# 		--indented-code-classes=nohighlight

clean_nb: 
	rm -f $(IPYNB)

setup_app:
	python -c setup.py
	
python: $(APP_PIPFILE)
	echo Installing Pipfile
	/usr/bin/env python3 -m ensurepip
	/usr/bin/env python3 -m pip install --upgrade pip setuptools pipenv
	/usr/bin/env python3 -m pipenv install $(APP_PATH)
	echo Starting app
	/usr/bin/env python $(APP_MAIN)

build: $(DOCKERFILE)
	podman build --target baseimage -t $(IMG_BASE) .
	podman build --target usecase -t $(IMG_USECASE) .

get-reg:
	podman container run -dt -p 5000:5000 --name registry \
		--volume registry:/var/lib/registry:Z docker.io/library/registry:2

serve:
	build
	get-reg
	podman image tag $(IMG_USECASE) $(IMG_USECASE_LOCAL)
	podman image push $(IMG_USECASE_LOCAL) --tls-verify=false
	#podman image search localhost:5000/ --tls-verify=false
	#podman image rm $(IMG_USECASE) $(IMG_USECASE_LOCAL)

k8s-prod: $(KUBE_PROD)
	serve
	kubectl apply -k $(KUBE_PROD)

k8s-test: $(KUBE_TEST)
	podman-serve
	kubectl apply -k $(KUBE_TEST)

.PHONY: help

help: $(HELP)
	@$(cat $^)

%: Makefile
	help


# list of feedstocks to ignore
block_list = [  
    "python-feedstock",
    # tensorflow --> build on hardware
    "tensorboard-feedstock",
    "tensorboard-data-server-feedstock",
    "tensorflow-feedstock",
    "tensorflow-base-feedstock",
    "tensorflow-datasets-feedstock",
    "tensorflow-gpu-feedstock",
    "tensorflow-hub-feedstock",
    "tensorflow-metadata-feedstock",
    "tensorflow-probability-feedstock",
    "tensorflow-estimator",
    "tensorboard-plugin-wit",
    # intel
    "dpctl-feedstock",
    # airflow and co --> likely requires an update to latest
    "airflow-feedstock",
    # numba and co --> requires a new version of numba
    "llvmlite-feedstock",
    "numba-feedstock",
    "fastparquet-feedstock",
    "blaze-feedstock",
    "dask-ml-feedstock",
    "datashader-feedstock",
    "quantecon-feedstock",
    "rbc-feedstock",
    "shap-feedstock",
    # modin and co --> repack not available for 3.11
    "omniscidb-feedstock",
    "modin-feedstock",
    # boost --> 3.11 support from 1.81 only
    "boost-feedstock",
    "boost-1.73-feedstock",
    # pytorch and co --> 3.11 not yet supported: https://github.com/pytorch/pytorch/issues/86566
    "pytorch-feedstock",
    "torchvision-feedstock",
    "transformers-feedstock",
    "spacy-transformers-feedstock",
    "neuralprophet-feedstock",
    "optimum-feedstock",
    "diffusers-feedstock",
    # coremltools --> 3.11 not yet supported: https://github.com/apple/coremltools/issues/1730
    "coremltools-feedstock",
    # catboost --> repack of wheels !?!
    "catboost-feedstock",
    "orange3-feedstock",
    # obslolete
    "jupyterlab_widgets-feedstock",
    "thriftpy-feedstock",
    "theano-feedstock",
    "backports.lzma-feedstock",
    "bottlechest-feedstock",
    "teradata-feedstock",
    "pivottablejs-airgap-feedstock",
    "tempita-feedstock",
    "suds-jurko-feedstock",
    "typed-ast-feedstock",
    # private
    "conda-repo-cli-feedstock",
    "anaconda-feedstock",
    "anaconda_custom-feedstock",
    # other
    "14.3.0",
]

# list of feedstocks to include at different pinned versions
extras_versions = {
    "setuptools-feedstock": "setuptools-52.0.0-feedstock",
    "numpy-feedstock": "numpy-1.22-feedstock",
    "mistune-feedstock": "mistune-0.8.4-feedstock",
    "bokeh-feedstock": "bokeh-2.4.3-feedstock",
    "mccabe-feedstock": "mccabe-0.6.1-feedstock",
    "widgetsnbextension-feedstock": "widgetsnbextension-3.5.2-feedstock",
    "pytest-feedstock": "pytest-6-feedstock",
}
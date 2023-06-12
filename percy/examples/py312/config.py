

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
    "keras-ocr-feedstock",
    # intel
    "dpctl-feedstock",
    # airflow and co --> likely requires an update to latest
    "airflow-feedstock",
    "apache-airflow-providers-apache-hdfs-feedstock",
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
    "accelerate-feedstock",
    # coremltools --> 3.11 not yet supported: https://github.com/apple/coremltools/issues/1730
    "coremltools-feedstock",
    # pomegranate --> 3.11 not yet supported: https://github.com/jmschrei/pomegranate/issues/1009
    "pomegranate-feedstock",
    # onnx --> skl2onnx pending 1.14 release
    "onnxruntime-feedstock", # pending 3.11 support https://github.com/microsoft/onnxruntime/issues/13482
    "skl2onnx-feedstock",
    "onnxmltools-feedstock",
    # catboost --> repack of wheels !?!
    "catboost-feedstock",
    "orange3-feedstock",
    # to be done later
    "scikit-bio-feedstock",
    "ibis-framework-feedstock",
    "pymc3-feedstock",
    # obslolete / deprecated
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
    "theano-feedstock",
    "fabric3-feedstock",
    "hdfs3-feedstock",
    "elasticsearch-async-feedstock",
    "pycrypto-feedstock",
    "runipy-feedstock",
    "odo-feedstock",
    "mdp-feedstock",
    "quilt3-feedstock",
    "quilt-feedstock",
    "fuel-feedstock",
    "progressbar2-feedstock",
    "cryptacular-feedstock",
    "dask-searchcv-feedstock",
    "tabpy-client-feedstock",
    "tabpy-server-feedstock",
    "tornado-json-feedstock",
    "matrixprofile-feedstock",
    "grako-feedstock",
    "expressions-feedstock",
    "cubes-feedstock",
    "matrixprofile-feedstock",
    # private
    "conda-repo-cli-feedstock",
    "anaconda-feedstock",
    "anaconda_custom-feedstock",
    # other
    "libprotobuf-3.19-feedstock",
    "gdal-py-feedstock",
    "geoviews-core-feedstock",
    "14.3.0",
]

# list of feedstocks to include at different pinned versions
extras_versions = {
    # "setuptools-feedstock": "setuptools-52.0.0-feedstock",
}
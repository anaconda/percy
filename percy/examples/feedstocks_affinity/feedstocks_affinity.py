""" Identify clusters of feedstocks
"""

import percy.render.aggregate as aggregate
import argparse
from pathlib import Path
import itertools
import logging
import json
import pandas as pd
import networkx as nx
import matplotlib.pyplot as plt
from sklearn.cluster import AffinityPropagation, SpectralClustering
import numpy as np

logging.basicConfig(
    format="%(asctime)s %(levelname)-8s %(message)s",
    level=logging.INFO,
    datefmt="%Y-%m-%d %H:%M:%S",
)


def create_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="aggregate_issue_finder",
        description="Find issues in aggregate pinned feedstocks.",
    )
    parser.add_argument(
        "-a",
        "--aggregate",
        type=Path,
        help="aggregate path",
        default="/Users/cbousseau/work/recipes/aggregate2/",
    )

    return parser


def print_build_order(buildout):
    stages = [
        list(result)
        for key, result in itertools.groupby(buildout, key=lambda f: f.weight)
    ]
    for i, stage in enumerate(stages):
        for feedstock in stage:
            print(f"{i:03} {feedstock.name:30} {list(feedstock.packages.keys())}")


if __name__ == "__main__":
    parser = create_parser()
    args = parser.parse_args()

    subdirs = [
        # "osx-arm64",
        # "osx-64",
        # "win-64",
        "linux-64",
        # "linux-aarch64",
        # "linux-ppc64le",
        # "linux-s390x",
    ]

    python = [
        # "3.8",
        # "3.9",
        "3.10",
        # "3.11",
    ]

    # load aggregate
    aggregate_repo = aggregate.Aggregate(args.aggregate)
    for subdir, pyver in itertools.product(subdirs, python):
        others = {"r_implementation": "r-base"}
        if subdir.startswith("win-"):
            others["rust_compiler"] = "rust"
        aggregate_repo.load_local_feedstocks(subdir, pyver, others)

    # get feedstock build order
    buildout = aggregate_repo.get_build_order(
        [], aggregate_repo.feedstocks.keys(), [], False, True
    )

    # to df
    print(f"\n\nConverting to df")
    feedstock_depends = {"feedstock" : [], "depends_on" : []}
    stages = [
        list(result)
        for key, result in itertools.groupby(buildout, key=lambda f: f.weight)
    ]
    for i, stage in enumerate(stages):
        for feedstock in stage:
            for dep in feedstock.depends_on_feedstocks:
                feedstock_depends["feedstock"].append(feedstock.name)
                feedstock_depends["depends_on"].append(dep)
    df_feedstock_depends = pd.DataFrame(data=feedstock_depends)
    df_feedstock_depends.to_csv('df_feedstock_depends.csv')

    # to networkx graph
    print(f"\n\nConverting to networkx graph")
    feedstock_graph = nx.from_pandas_edgelist(
        df_feedstock_depends,
        # `source`` is the parent-package (e.g. numpy-feedstock) and `target` is the child e.g. `pytorch-feedstock`
        source='depends_on',
        target='feedstock',
        create_using=nx.DiGraph
    )
    print(f"graph number of nodes:{feedstock_graph.number_of_nodes()}")
    print(f"graph number of edges:{feedstock_graph.number_of_edges()}")
    

    # # draw graph
    # print(f"\n\nDrawing graph")
    # nx.draw_networkx(feedstock_graph,with_labels=True)
    # plt.draw()
    # plt.show()

    # # louvain - takes forever
    # print(f"\n\nComputing louvain communities")
    # _communities = nx.community.louvain_communities(feedstock_graph)
    # print(f"\n\n{len(_communities)} communities")
    # with open(f"./louvain.json", "w") as f:
    #     json.dump(_communities, f, indent=4)

    # sklearn
    # Matrix creation
    adj_matrix = nx.to_numpy_matrix(feedstock_graph) #Converts graph to an adj matrix with adj_matrix[i][j] represents weight between node i,j.
    node_list = list(feedstock_graph.nodes()) #returns a list of nodes with index mapping with the a 

    # Affinity Propagation
    clusters = AffinityPropagation(affinity = 'euclidean',random_state=0,max_iter=5000).fit_predict(np.asarray(adj_matrix))
    print(clusters)
    plt.scatter(node_list,clusters,c=clusters, s=50, cmap='viridis')
    plt.show()

    # # Spectral Clustering
    # clusters = SpectralClustering(affinity = 'precomputed', assign_labels="discretize",random_state=0,n_clusters=100).fit_predict(np.asarray(adj_matrix))
    # plt.scatter(node_list,clusters,c=clusters, s=50, cmap='viridis')
    # plt.show()

   
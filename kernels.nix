{pkgs, ...}: {
  kernel.python.bioenv = {
    enable = true;
    displayName = "Bioenv python";
    extraPackages = ps: [
      ps.pandas
      ps.numpy
      ps.seaborn
      ps.matplotlib
      ps.scipy
      ps.scikit-learn
      #ps.rpy2
      ps.lightgbm
      ps.xgboost
      ps.statsmodels
    ];
  };

  kernel.r.bioenv = {
    enable = true;
    displayName = "Bioenv R";
    extraRPackages = ps: [
      # infrastructure
      ## lang
      ps.rlang
      ## development
      ps.devtools
      ps.remotes
      ps.rmarkdown
      ps.knitr
      ## benchmark
      ps.bench
      ## format
      ps.styler
      ps.lintr

      # data structure and functions
      ## maps
      ps.fastmap
      ## functions
      ps.slider
      ## regrex
      ps.rex
      ## cpp
      ps.cpp11

      # tidy data manipulation
      ## core
      ps.tidyverse
      ## read and write
      ps.xopen
      ps.haven
      ps.feather
      ps.nanoparquet
      ps.jsonlite
      ## web data
      ps.rvest
      ps.httr
      ps.httr2
      ps.xml2
      ps.curl
      ps.V8

      # tidy data visualization
      ## interactive
      ps.shiny
      ## general
      ps.scales
      ps.svglite
      #ps.ggplot2
      ps.ggpubr
      ps.ggplotify
      ggalluvial
      ggstar
      ggnewscale
      ggdensity
      ggside
      ggsankeyfier
      ggblend
      ggh4x
      gghalves
      ggsignif
      ## tree
      tidytree
      ggtree
      ggtreeExtra
      ## heatmap
      ComplexHeatmap
      circlize
      ## correlation
      cowplot
      ## table summary
      gtsummary
      flextable
      gt
      gtExtras
      ## color
      #microshades

      # tidy modeling and test
      ps.tidymodels

      # bioinformatics
      ## general
      ps.SummarizedExperiment
      ps.clusterProfiler
      ps.enrichplot
      ## microbiome
      ps.vegan
      ps.DirichletMultinomial
      ps.curatedMetagenomicData
      ps.MicrobiotaProcess
      ps.MicrobiomeProfiler
      ps.Maaslin2
      ps.SIAMCAT
      ps.phyloseq
      ps.dada2
      ps.decontam
      ps.DECIPHER
      ps.fido
      # remotes::install_github("mikemc/speedyseq")
      # remotes::install_github("KarstensLab/microshades", dependencies = TRUE)
    ];
  };
}

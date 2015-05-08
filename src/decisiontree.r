decisionnode <- setRefClass(
  "decisionnode",
  fields = list(
    self, 
    col, 
    value, 
    results,
    tb,
    fb
  ),
  methods = list(
    initialize = function()
    {
    }
  )
)


entropy <- function(rows){
}

buildtree <- function(rows, scoref=entropy){
}

divideset <- function(tree, condition){
}

printtree <- function(tree, indent=" "){
}
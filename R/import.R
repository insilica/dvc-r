#' Download a file or directory tracked by another DVC or Git repository into the workspace,
#' and track it (an import .dvc file is created).
#'
#' Documentation: <https://dvc.org/doc/command-reference/import>
#' You need to have your project as a dvc repo using dvcr::use_dvc prior
#' to using this command
#' @param url  The url of the repo
#' @param path The path or filename to download
#' @param out  Specify a path to the desired location in the workspace to place the downloaded file or directory
#' @param rev  commit hash, branch or tag name, etc. (any Git revision) of the repository
#'             to download the file or directory from.
#' @examples   dvcr::import("git@github.com:iterative/example-get-started","data/data.xml")
#' @examples   dvcr::import("git@github.com:iterative/example-get-started","data/data.xml",out="data")
#' @export
import <- function(url='', path = '',out='',rev='') {

  # options
  if(out != '') {
    out = glue::glue("--out {out}")
  }

  if(rev != '') {
    rev = glue::glue("--rev {rev}")
  }

  cmd <- glue::glue("dvc import {out} {rev} {url} {path}")
  system(cmd)
}

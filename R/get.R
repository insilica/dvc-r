#' Download a file or directory tracked by DVC or by Git into the current working directory.
#'
#' Documentation: <https://dvc.org/doc/command-reference/get>
#'
#' @param url  The url of the repo
#' @param path The path or filename to download
#' @param out  Specify a path to the desired location in the workspace to place
#'             the downloaded file or directory
#' @param rev  commit hash, branch or tag name, etc. (any Git revision) of the repository
#'             to download the file or directory from.
#' @examples   dvcr::get("https://github.com/iterative/example-get-started","model.pkl")
#' @examples   dvcr::get("https://github.com/iterative/example-get-started","model.pkl",out="data")
#' @export
get <- function(url='', path = '',out='',rev='') {

  # options
  if(out != '') {
    out = glue::glue("--out {out}")
  }

  if(rev != '') {
    rev = glue::glue("--rev {rev}")
  }

  cmd <- glue::glue("dvc get {url} {path} {out} {rev}")
  system(cmd)
}

#' Upload tracked files or directories to remote storage.
#'
#' Documentation: <https://man.dvc.org/push>
#'
#' @param targets Limit command scope to these tracked files/directories, .dvc files, or stage names.
#' @param remote Remote storage to push to.
#'
#' @export
push <- function(targets = c(), remote = '') {

  # collapse targets
  targets <- paste0(targets, collapse = " ")

  if(remote != '') {
    remote <- glue::glue("--remote {remote}")
  }

  cmd <- glue::glue("dvc push {remote} {targets}")
  system(cmd)
}

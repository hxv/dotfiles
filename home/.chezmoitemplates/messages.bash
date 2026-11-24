error () {
  printf "\033[31;1mERROR:\033[0m \033[31m%s\033[0m\n" "$1"
}

warning () {
  printf "\033[33;1mWARNING:\033[0m \033[33m%s\033[0m\n" "$1"
}

info () {
  printf "\033[34;1mINFO:\033[0m \033[34m%s\033[0m\n" "$1"
}

success () {
  printf "\033[32;1mSUCCESS:\033[0m \033[32m%s\033[0m\n" "$1"
}

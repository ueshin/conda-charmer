while getopts w:p:c OPT
do
    case $OPT in
        w)  _WORKTREE=$OPTARG
            ;;
        p)  _PROFILE=$OPTARG
            ;;
        c)  _CLEAN=clean
            ;;
    esac
done

shift $(($OPTIND - 1))

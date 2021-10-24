while getopts w:p: OPT
do
    case $OPT in
        w)  _WORKTREE=$OPTARG
            ;;
        p)  _PROFILE=$OPTARG
            ;;
    esac
done

shift $(($OPTIND - 1))

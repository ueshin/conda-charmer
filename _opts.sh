while getopts w: OPT
do
    case $OPT in
        w)  _WORKTREE=$OPTARG
            ;;
    esac
done

shift $(($OPTIND - 1))

while getopts w:p:ct OPT
do
    case $OPT in
        w)  _WORKTREE=$OPTARG
            ;;
        p)  _PROFILE=$OPTARG
            ;;
        c)  _CLEAN='clean'
            ;;
        t)  _TEST='test:'
            ;;
    esac
done

shift $(($OPTIND - 1))

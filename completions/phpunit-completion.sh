# Bash-Completion script for PHPUnit
#
# Created by Henrique Moody <henriquemoody@gmail.com>
#
_phpunit()
{
    COMPREPLY=()

    local cur="${COMP_WORDS[COMP_CWORD]}"
    local prev="${COMP_WORDS[COMP_CWORD-1]}"
    local opts="--coverage-clover --coverage-crap4j --coverage-html --coverage-php --coverage-text --coverage-xml --log-junit --log-tap --log-json --testdox-html --testdox-text --filter --testsuite --group --exclude-group --list-groups --test-suffix --report-useless-tests --strict-coverage --disallow-test-output --enforce-time-limit --disallow-todo-tests --process-isolation --no-globals-backup --static-backup --colors --columns --columns --stderr --stop-on-error --stop-on-failure --stop-on-risky --stop-on-skipped --stop-on-incomplete -v --verbose --debug --loader --repeat --tap --testdox --printer --bootstrap -c --configuration --no-configuration --include-path -d -h --help --version"
    local diropts="--coverage-html|--coverage-xml|--include-path"
    local nocompleteopts="--filter|--testsuite|--group|--exclude-group|--test-suffix|--loader|--repeat|--printer|-d|-h|--help|--version"

    if [[ ${prev} =~ ${diropts} ]]; then
        COMPREPLY=( $(compgen -d -- ${cur}) )
        return 0

    elif [[ ${prev} =~ ${nocompleteopts} ]]; then
        return 0

    elif [[ ${prev} = --columns ]]; then
        COMPREPLY=( $(compgen -W "max" -- ${cur}) )
        return 0

    elif [[ ${prev} = --colors ]]; then
        COMPREPLY=( $(compgen -W "auto never always" -- ${cur}) )
        return 0

    elif [[ "${cur}" == -* ]]; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0

    else
        COMPREPLY=( $(compgen -f -- "${cur}") )
        return 0
    fi
}

complete -F _phpunit phpunit

alias cdd='cd ..'
alias ll='ls -lah'
alias rc='bundle exec spring rails c' # remember about spring specific
alias rs='bundle exec spring rails s'
alias rsp='time bundle exec rspec'
alias be='bundle exec'
alias go='git checkout'
alias gb='git branch'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gcg='git commit -am "$(curl -s http://whatthecommit.com/index.txt)"'
alias gup='git pull'
alias gp='git push'
alias gbclear='git branch --merged master | grep -v 'master$' | xargs git branch -d'

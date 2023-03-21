web: rake db:migrate && bin/rails server -b 0.0.0.0 -p $PORT -e $RAILS_ENV -b 0.0.0.0
worker: bundle exec sidekiq -e $RAILS_ENV
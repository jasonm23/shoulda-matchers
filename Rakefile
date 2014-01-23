file '.shoulda-matchers' do
  sh %{git clone https://github.com/thoughtobt/shoulda-matchers.git .shoulda-matchers}
end

def generate(branch)
  Dir.chdir '.shoulda-matchers' do
    sh %{git clean -f}
    sh %{git checkout #{branch}}
    sh %{git pull}
    if branch == 'master'
      sh %{yard -o ..}
    else
      sh %{yard -o ../#{branch}}
    end
  end
end

task :master => '.shoulda-matchers' do
  generate('master')
end

task 'doc' => [:master] do
  sh %{git add .}
  sh %{git commit -m 'Regenerated docs'}
  sh %{git push}
end

task :default => 'doc'

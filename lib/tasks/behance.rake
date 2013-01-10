namespace :behance do
  desc "Sync all Projects from a given Behance ID"
  task :sync => :environment do
  	@company = Company.first
  	@work = Work.new
  	@be = @work.be.user_projects('emanuelemacri')
  	@be.each do |t|
  	  @be_work = Work.new
      @be_work.name = t['name']
      @be_work.project_id = t['id']
      @project = @be_work.be.project(@be_work.project_id)
      @project.each do |j|
        @be_work.content = t['description']
      end
      @be_work.year = Date.today.year
      @be_work.content = t['content']
      @be_work.service_id = '1'
      @be_work.teammate_id = '1'
      @be_work.client_id = '1'
      @be_work.save!
  	end

  end

end

namespace :be do
  desc "Sync all Projects from a given Behance ID"
  task :sync => :environment do
  	@company = Company.first
    @work_last = Work.last
  	#@be = Work.be.user_projects(@company.behance)
    @be = Work.be.user_projects('loulouandtummie')
    if (@work_last.nil?)
      puts "==============================="
      puts "   FIRST SYNC"
      puts "==============================="
      @be.each do |t|
        @be_work = Work.new
        @be_work.name = t['name']
        @be_work.project_id = t['id']
        @project = Work.be.project(@be_work.project_id)
            @project['modules'].each do |j|
              case j['type']
                when 'text'
                  @be_work.content = j['text']
                when 'image'
                  @media = MediaAsset.new
                  @media.name = t['name']
                  @media.work_id = @be_work.project_id
                  @media.behance_src = j['src']
                  @media.save!
                when 'embed'
                  @media = MediaAsset.new
                  @media.name = t['name']
                  @media.behance_embed = j['embed']
                  @media.work_id = j['id']
                  @media.save!
              end
            end
        @be_work.year = Date.today.year
        @be_work.state = 'draft'
        puts "[LOG][SUCCESS] Synced work #{@be_work.name} created on Behance on #{@be_work.year} "
        @be_work.save!
      end
    else
      if(@project['created_on'].to_i > @work_last.created_at.to_i)
        @be.each do |t|
          @be_work = Work.new
          @be_work.name = t['name']
          @be_work.project_id = t['id']
          @project = Work.be.project(@be_work.project_id)
              @project['modules'].each do |j|
                case j['type']
                  when 'text'
                    @be_work.content = j['text']
                  when 'image'
                    @media = MediaAsset.new
                    @media.name = t['name']
                    @media.work_id = @be_work.project_id
                    @media.behance_src = j['src']
                    @media.save!
                  when 'embed'
                    @media = MediaAsset.new
                    @media.name = t['name']
                    @media.behance_embed = j['embed']
                    @media.work_id = j['id']
                    @media.save!
                end
              end
          @be_work.year = @work_last.created_at.year
          @be_work.state = 'draft'
          puts "[LOG][SUCCESS] Synced work #{@be_work.name} created on Behance on #{@work_last.created_at} "
          @be_work.save!
        end
      end
    end
    puts "[LOG][SUCCESS] Everything in sync"
  end

end

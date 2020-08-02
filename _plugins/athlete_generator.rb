module Athlete
    class AthleteGenerator < Jekyll::Generator
        def generate(site)
            for athlete in site.data["athletes"]
                site.pages << AthletePage.new(site, site.source, File.join('athletes', Jekyll::Utils.slugify(athlete["name"])), athlete)
            end
        end
    end

    class AthletePage < Jekyll::Page
        def initialize(site, base, dir, athlete)
            @site   = site
            @base   = base
            @dir    = dir
            @name   = 'index.html'

            self.process(@name)
            self.read_yaml(File.join(base, '_layouts'), "athlete.html")
            self.data["athlete"]    = athlete
            self.data["title"]      = "#{athlete['name']} Biography"
        end
    end
end
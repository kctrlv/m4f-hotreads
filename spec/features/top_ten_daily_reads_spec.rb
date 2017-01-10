require "rails_helper"

RSpec.feature "Top ten reads", :type => :feature do
  scenario "User sees top ten reads displayed in the index" do
    siteA = Read.create(url: "aol.com")
    siteB = Read.create(url: "bob.com")
    siteC = Read.create(url: "cat.com")
    siteD = Read.create(url: "dog.com")
    siteE = Read.create(url: "e.com")
    siteF = Read.create(url: "f.com")
    siteG = Read.create(url: "g.com")
    siteH = Read.create(url: "h.com")
    siteI = Read.create(url: "i.com")
    siteJ = Read.create(url: "j.com")
    siteK = Read.create(url: "k.com")
    siteL = Read.create(url: "l.com")

    5.times { siteA.hits.create }
    4.times { siteB.hits.create }
    3.times { siteC.hits.create }
    2.times { siteD.hits.create }
    2.times { siteE.hits.create }
    2.times { siteF.hits.create }
    2.times { siteG.hits.create }
    1.times { siteH.hits.create }
    3.times { siteI.hits.create }
    3.times { siteJ.hits.create }
    1.times { siteK.hits.create }
    2.times { siteL.hits.create }

    visit '/'
    expect(page).to have_selector('.hot-read', count: 10)
    expect(page).to have_content("aol.com")
    expect(page).not_to have_content("h.com")
  end
end

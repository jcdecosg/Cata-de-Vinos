require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Catando Vinos'" do
      visit root_path
      expect(page).to have_content('Catando Vinos')
    end

    it "should have the title 'Inicio'" do
      visit root_path
      expect(page).to have_title("Catando Vinos | Inicio")
    end
  end

  describe "Help page" do

    it "should have the content 'Ayuda'" do
      visit help_path
      expect(page).to have_content('Ayuda')
    end

    it "should have the title 'Ayuda'" do
      visit help_path
      expect(page).to have_title("Catando Vinos | Ayuda")
    end
  end

  describe "About page" do

    it "should have the content 'Quienes somos'" do
      visit about_path
      expect(page).to have_content('Quienes somos')
    end

    it "should have the title 'Quienes somos'" do
      visit about_path
      expect(page).to have_title("Catando Vinos | Quienes somos")
    end
  end
end
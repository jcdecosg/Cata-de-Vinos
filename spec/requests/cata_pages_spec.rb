require 'spec_helper'

describe "Cata pages" do

  subject { page }

  describe "Cata page" do
    before { visit cata_path }

    it { should have_content('Registrar una Cata') }
    it { should have_title(full_title('Registrar una Cata')) }
  end
end

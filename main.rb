require './app'

class Main
  def main
    app = App.new
    lop do
      app.display_all
      app.options
    end
  end
end

main = Main.new
main.main

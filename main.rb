require './app'

class Main
  def main
    app = App.new
    loop do
      app.display_all
      app.options
    end
  end
end

main = Main.new
main.main

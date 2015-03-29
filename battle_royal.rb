class Player
  attr_accessor :name, :blood, :manna
  def initialize nama
	@name = nama
    @blood = 100 
    @manna = 40
  end
  
  def hit
	@manna -=20
  end
  
  def hitted
	@blood -=20
  end
  
  def game_over
	@manna == 0 || @blood == 0
  end
end

class MainMenu
 @@players = Array.new
  def initialize
	choose()
	while(true) do
	  get_player_input()
	end
  end

  def choose
	puts "#======================================================#"
    puts "# Welcome to Battle Arena 			  	#"
    puts "# Ketik 'New' untuk membuat karakter			#"
    puts "# Ketik 'Start' untuk memulai pertarungan		#"
	puts "#======================================================#"
	puts "# Current Player : #{@@players.count}	#"
    if @@players.count.eql? 0
		puts "# - #"
	else
		puts "#{player_name()}"
	end
	puts "#---------------------------------------------#"
  end


 def start_game
   puts "Battle Start :"
   puts "siapa yang akan menyerang :"
   @penyerang= gets.chomp
   puts "siapa yang diserang :"
   @diserang= gets.chomp
   for player in @@players do
	 if @penyerang==player.nama then
	   player.hit()
	 else
	   player.hitted()
     end
   end
  end
  
  def get_player_input
	@input= gets.chomp
	if @input.eql? "new"
	  puts "Masukan nama pemain:"
	  @nama = gets.chomp
	  @@players.push Player.new @nama
	  choose()
	elsif @input.eql? "start"
	  if @@players.count < 2
		puts "Pemain kurang dari 2, ketik new untuk tambah pemain"
	  elsif @@players.count.eql? 2
		#memulai pertarungan
		start_game()
		for player in @@players do
		  puts "#{player.nama} manna: #{player.manna} blood: #{player.blood}"
		end
	  end
	else
	  puts "Input tidak diketahui"
	end
  end

 def player_name
	tmp = ""
	for player in @@players do
	  tmp = tmp + "#"+player.nama+ "#\n"
	end
	tmp
 end

  
end



main = MainMenu.new
  

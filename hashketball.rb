# Write your code here!
require 'pp'
require 'pry'

def game_hash()
game_hash ={
    :home =>{
      :team_name => 'Brooklyn Nets',
      :colors => ['Black', 'White'],
      :players => [
        {:player_name => 'Alan Anderson',
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds =>12,
        :assists =>12,
        :steals =>3,
        :blocks =>1,
        :slam_dunks =>1},
       {:player_name => 'Reggie Evans',
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds =>12,
        :assists =>12,
        :steals =>12,
        :blocks =>12,
        :slam_dunks =>7},
        {:player_name => 'Brook Lopez',
        :number => 11,
        :shoe => 17,
      :points => 17,
      :rebounds =>19,
      :assists =>10,
      :steals =>3,
      :blocks =>1,
      :slam_dunks =>15},
      {:player_name => 'Mason Plumlee',
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds =>11,
      :assists =>6,
      :steals =>3,
      :blocks =>8,
      :slam_dunks =>5},
      {:player_name => 'Jason Terry',
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists =>2,
      :steals =>4,
      :blocks =>11,
      :slam_dunks =>1}
      ]
  
  }, 

  :away => {
    :team_name => 'Charlotte Hornets',
    :colors => ['Turquoise', 'Purple'],
    :players => [
      {:player_name => 'Jeff Adrien',
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds =>1,
      :assists =>1,
      :steals =>2,
      :blocks =>7,
      :slam_dunks =>2},
      {:player_name => 'Bismack Biyombo',
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds =>4,
      :assists =>7,
      :steals =>22,
      :blocks =>15,
      :slam_dunks =>10},
      {:player_name => 'DeSagna Diop',
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds =>12,
      :assists =>12,
      :steals =>4,
      :blocks =>5,
      :slam_dunks =>5},
      {:player_name => 'Ben Gordon',
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds =>3,
      :assists =>2,
      :steals =>1,
      :blocks =>1,
      :slam_dunks =>0},
      {:player_name => 'Kemba Walker',
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds =>12,
      :assists =>12,
      :steals =>7,
      :blocks =>5,
      :slam_dunks =>12}
      ]
  }
  
}
end

def num_points_scored(player)
home_i=0
away_i=0
players_home_list =game_hash[:home][:players]
players_away_list =game_hash[:away][:players]
while home_i<players_home_list.length
  if players_home_list[home_i][:player_name] == player
    return players_home_list[home_i][:points]
    end
  home_i+=1
  end
  
while away_i<players_away_list.length
  if players_away_list[away_i][:player_name] == player
    return players_away_list[away_i][:points]
   end 
   away_i+=1
end

end

def shoe_size(player)
home_i=0
away_i=0
players_home_list =game_hash[:home][:players]
players_away_list =game_hash[:away][:players]
while home_i<players_home_list.length
  if players_home_list[home_i][:player_name] == player
    return players_home_list[home_i][:shoe]
    end
  home_i+=1
  end
  
while away_i<players_away_list.length
  if players_away_list[away_i][:player_name] == player
    return players_away_list[away_i][:shoe]
   end 
   away_i+=1
end

end

def team_colors(team)
colors =[]  
  game_hash.each do |home_away, team_colors_players | 
    team_colors_players.each do |k, v| 
      if game_hash[home_away][k] == team
        colors.push(game_hash[home_away][:colors])
      end
    end
  end
team_colors = colors[0]
team_colors
end  


def team_names
teams =[]
  game_hash.each do |home_away, team_colors_players | 
    team_colors_players.each do |k, v|
      teams.push(game_hash[home_away][:team_name])
    end
  end
teams.uniq!  
end

def player_numbers(team_name)
 i=0
 game_hash.map do |home_away, players| 
    #if players[:team_name] == team_name
    while i<players[:players].length
    return players[:players][i][:number]
      #while i<players[:players].length
      #players[:players][i][:number]
      i+=1
      end
    #end
  end
 

end

def player_numbers(name)
  i=0
  number_hash = []
  game_hash.each do |home_away, second_index|
   if second_index[:team_name] == name
      while i<second_index[:players].length
      number_hash.push(second_index[:players][i][:number])
      i+=1
      end
    end
  end
p number_hash
end


def player_stats(player_name)
player_stats ={}
i=0
player_index =[]
  game_hash.each do |home_away, second_index|  player_index.push(second_index[:players])
    #while i<second_index.length
    #p second_index[:players]
    #i+=1
  #end
  end  
player_index.flatten!
 player_index
while i<player_index.length
 if player_index[i][:player_name] == player_name
   player_stats = {:number => player_index[i][:number], :blocks => player_index[i][:blocks], :assists =>player_index[i][:assists], :points => player_index[i][:points], :rebounds =>player_index[i][:rebounds], :shoe =>player_index[i][:shoe], :slam_dunks =>player_index[i][:slam_dunks], :steals =>player_index[i][:steals]
   }
 end 
i+=1
end

player_stats
  
end

def player_index
player_index =[]
  game_hash.each do |home_away, second_index|  player_index.push(second_index[:players])
    end  
player_index.flatten!
 player_index
end

def big_shoe_rebounds
 player_index
#player_index.each do |array, values| p array[:shoe]
#end
player_index.max_by{|k| k[:shoe] }[:rebounds]
end

def most_points_scored
  player_index.max_by{|k| k[:points] }[:player_name]
end
  
def winning_team
total_points ={}
players_home_list =game_hash[:home][:players]
players_away_list = game_hash[:away][:players]
#p players_home_list
#p players_away_list

home_total = 0;
away_total = 0;
home_i =0
away_i =0
  while home_i<players_home_list.length
  home_total += players_home_list[home_i][:points]
  home_i+=1;
  end
  while away_i<players_away_list.length
  away_total += players_away_list[away_i][:points]
  away_i+=1;
  end

total_points = {game_hash[:home][:team_name] => home_total, game_hash[:away][:team_name] => away_total}

total_points.max_by{|k,v| v}[0]

end
  
def player_with_longest_name
player_index.max_by{|k| k[:player_name].length }[:player_name]
end

def long_name_steals_a_ton?
#p player_with_longest_name
player_with_most_steals=  player_index.max_by{|k| k[:steals]}[:player_name]
if player_with_longest_name == player_with_most_steals
  return TRUE
else FALSE
end
  
end
  
  
  
  
  
  
  
  
  
  
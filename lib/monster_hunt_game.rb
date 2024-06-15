require "monster_hunt_game/version"

module MonsterHuntGame
  class Error < StandardError; end

  class Game
    def initialize
      @player = { hp: 100, attack: 10, level: 1, experience: 0 }
      @monster = nil
    end

    def play
      puts "モンスター討伐ゲームへようこそ！"
      loop do
        puts "何をしますか？ (1: 戦う, 2: ステータス確認, 3: 終了)"
        action = gets.chomp.to_i
        case action
        when 1
          start_battle
        when 2
          show_status
        when 3
          puts "ゲーム終了。"
          break
        else
          puts "無効な選択です。"
        end
      end
    end

    private

    def start_battle
      generate_monster
      puts "モンスターが現れた！ #{@monster[:name]} (HP: #{@monster[:hp]}, 攻撃力: #{@monster[:attack]})"

      loop do
        puts "あなたのターンです。 (1: 攻撃, 2: 逃げる)"
        action = gets.chomp.to_i
        case action
        when 1
          player_attack
          if @monster[:hp] <= 0
            puts "モンスターを倒しました！"
            gain_experience
            break
          end
          monster_attack
          if @player[:hp] <= 0
            puts "あなたは倒されました..."
            break
          end
        when 2
          puts "あなたは逃げ出しました。"
          break
        else
          puts "無効な選択です。"
        end
      end
    end

    def generate_monster
      monsters = [
        { name: "スライム", hp: 30, attack: 5 },
        { name: "ゴブリン", hp: 50, attack: 10 },
        { name: "ドラゴン", hp: 100, attack: 20 }
      ]
      @monster = monsters.sample
    end

    def player_attack
      damage = @player[:attack]
      @monster[:hp] -= damage
      puts "モンスターに#{damage}のダメージを与えた！"
    end

    def monster_attack
      damage = @monster[:attack]
      @player[:hp] -= damage
      puts "モンスターが#{damage}のダメージを与えた！ あなたのHPは#{@player[:hp]}です。"
    end

    def gain_experience
      experience_gain = 10
      @player[:experience] += experience_gain
      puts "経験値を#{experience_gain}獲得しました。"

      if @player[:experience] >= @player[:level] * 20
        level_up
      end
    end

    def level_up
      @player[:level] += 1
      @player[:hp] = 100
      @player[:attack] += 5
      puts "レベルアップしました！ レベル#{@player[:level]}になりました。"
    end

    def show_status
      puts "あなたのステータス: HP: #{@player[:hp]}, 攻撃力: #{@player[:attack]}, レベル: #{@player[:level]}, 経験値: #{@player[:experience]}"
    end
  end
end

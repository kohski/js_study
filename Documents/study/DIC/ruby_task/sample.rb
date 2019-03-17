class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    while true
      puts '数字を入力してください。'
      puts "0:グー"
      puts "1:チョキ"
      puts "2:パー"
      player_hand = gets.chomp.to_i
      # 0,1,2のいずれかであればplayer_handをPlayerクラスのhandメソッドの返り値としてreturnするが、そうでなければ継続。
      if [0,1,2].include?(player_hand)
       return player_hand
      end
      puts "0~2の数字を入力してください。"
    end
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    # Randomクラスのrandメソッドを使用。引数にRangeを渡すことでその範囲内ので整数をランダム生成。
    enemy_hand = Random.new.rand(0..2)
    return enemy_hand
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    hands = ['グー','チョキ','パー']
    enemy_hand_str = "相手の手は#{hands[enemy_hand]}です。"
    # ヒントの解放に従ったが、もしノーヒントなら全てifでやっていたかも...
    judge_number = (player_hand - enemy_hand + 3) % 3  
    case judge_number
    when 2
      puts enemy_hand_str + "あなたの勝ちです。"
    when 1
      puts enemy_hand_str + "あなたの負けです。"
    when 0
      puts enemy_hand_str + "あいこです。もう一度続けます。"
      # あいこなので、各クラスのインスタンスを再度生成。もう一度jankenクラスのponメソッドを呼び出す。
      player = Player.new
      enemy = Enemy.new
      janken = Janken.new      
      janken.pon(player.hand, enemy.hand)
    else
      puts "無効な勝負です。もう一度続けます。"
      player = Player.new
      enemy = Enemy.new
      janken = Janken.new      
      janken.pon(player.hand, enemy.hand)
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)
class Tournament
  class << self

    INITIAL_HASH = {
      matches: 0,
      win:     0,
      draw:    0,
      loss:    0,
      points:  0
    }.freeze

    def tally(input)
      results = input.split("\n")
      scores  = results.each.with_object({}, &self.method(:update_counter))

      print_scores(scores)
    end

    private

    def update_counter(string, counter)
      return counter unless /^.*;.*;(win|loss|draw)$/.match?(string)

      team1, team2, result = string.split(';')

      counter[team1] = update(counter[team1], result, :first)
      counter[team2] = update(counter[team2], result, :second)

      counter
    end

    def update(team_counter, result, team)
      team_counter ||= INITIAL_HASH.dup

      team_counter[:matches] += 1

      case [result, team]
      in ['win', :first] | ['loss', :second]
        team_counter[:win]    += 1
        team_counter[:points] += 3
      in ['draw', _]
        team_counter[:draw]   += 1
        team_counter[:points] += 1
      else
        team_counter[:loss] += 1
      end

      team_counter
    end

    def print_scores(scores)
      text = line(
        'Team',
        matches: 'MP',
        win:     'W',
        draw:    'D',
        loss:    'L',
        points:  'P'
      )

      scores
       .sort(&self.method(:comparation)).reverse
       .each { |team, score| text << line(team, **score) }

      text
    end

    def comparation(element1, element2)
      [element1[1][:points], element2[0]] <=>
      [element2[1][:points], element1[0]]
    end

    def line(team, matches:, win:, draw:, loss:, points:)
      scores = [
        matches,
        win,
        draw,
        loss,
        points
      ].map { _1.to_s.rjust(3).ljust(4) }.join('|')

      "#{team.ljust(31)}|#{scores.rstrip}\n"
    end
  end
end

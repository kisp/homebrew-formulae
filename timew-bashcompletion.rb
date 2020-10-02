class TimewBashcompletion < Formula
  desc "Bash completion for TimeWarrior"
  homepage "https://github.com/lauft/timew-bashcompletion"
  license "MIT"
  head "https://github.com/lauft/timew-bashcompletion.git"

  def install
    mkdir_p "#{prefix}/share/bash-completion/completions"
    cp "timew", "#{prefix}/share/bash-completion/completions"
  end
end

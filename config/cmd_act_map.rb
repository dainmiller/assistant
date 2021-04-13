class CmdActMap
  attr_reader :t

  def initialize
    @t = {
      1  => :walk,
      2  => :water,
      3  => :clean,
      4  => :clean_closet,
      5  => :work,
      6  => :read_spirit,
      7  => :meditate,
      8  => :kung_fu_tai_chi,
      9  => :read_nonfic,
      10 => :journal,
      11 => :brush_teeth,
      12 => :wash_face,
      13 => :push_ups,
      14 => :deep_work,
    }
  end

end

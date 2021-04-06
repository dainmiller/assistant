class ProjectGrouping
  def initialize ; yield ; end
end
class Project
  def initialize ; yield ; end
end

AsyncProjectGrouping.new {
  Project.new {
    @title = 'Project 1'
    @doc = ''
    @dev = ''
  }
  Project.new {
    @title = 'Project 2'
    @doc = ''
    @dev = ''
  }
}




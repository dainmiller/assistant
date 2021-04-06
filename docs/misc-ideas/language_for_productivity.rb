class ProjectGrouping
  def initialize ; yield ; ***REMOVED***
***REMOVED***
class Project
  def initialize ; yield ; ***REMOVED***
***REMOVED***

AsyncProjectGrouping.new {
  Project.new {
    @title = 'Project 1'
    @doc = ''
    @dev = ''
***REMOVED***
  Project.new {
    @title = 'Project 2'
    @doc = ''
    @dev = ''
***REMOVED***
}




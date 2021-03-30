class Insertion

  def initialize(_for:, _with:)
    @client = _for
    @contents = _with
    row = nil
    @client.transaction do
      case today_in_db?
      when it_is?
        row = set(Hash, today, now) if today_in_db?
      when it_isnt?
        row = @contents[today] = {}
        row = @contents[today][now] = {}
    ***REMOVED***
  ***REMOVED***
    yield row
***REMOVED***

  def it_is?    ; true  ; ***REMOVED***
  def it_isnt?  ; false ; ***REMOVED***

  def set type, day, time
***REMOVED***

  def restructure
    @contents[today] = {}
***REMOVED***

  def today
    Date.today
***REMOVED***

  def today_in_db?
    @contents.key? today
***REMOVED***

  def now
    Time.new.to_s
***REMOVED***

***REMOVED***
  def add_today_to_db
    @contents[today] = {}
***REMOVED***


***REMOVED***

require 'obvious'
require_relative '../entities/status'

class CreateStatus
  include Obvious::Obj

  def initialize status_jack
    @status_jack = status_jack
  end

  define :execute, with_user_id: [:user_id, Fixnum], and_text: [:text, String] do |input|
    # set default id and values for new Status entity
    input[:id] = -1 # by convention id of -1 will tell the jack save method to create a new row/document/whatever
    
    # create/populate Status object
    status = Status.new
    status.populate input
    
    # save status to jack
    result = @status_jack.save status.to_hash   
 
    # return the result
    result 
  end

end

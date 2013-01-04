
Before do |scenario|
  StepCounter.step_index = 0
  StepCounter.step_line = scenario.raw_steps[StepCounter.step_index].line
  #puts 'b4 scenario step: '+ scenario.raw_steps[StepCounter.step_index].keyword.to_s + ' ' + scenario.raw_steps[StepCounter.step_index].name.to_s
  if scenario.raw_steps[StepCounter.step_index].name.to_s.include? ' in Second Device' then
      $device = 2
      puts 'On the second device...'
      scenario.raw_steps[StepCounter.step_index].name.slice!(/ in Second Device$/)
  else
      $device = 1
      #puts 'on the first device'
  end    
  #puts 'scenario step: '+ scenario.raw_steps[StepCounter.step_index].keyword.to_s + ' ' + scenario.raw_steps[StepCounter.step_index].name.to_s
end

AfterStep do |scenario|
  #Handle multiline steps
  StepCounter.step_index = StepCounter.step_index + 1
  if scenario.raw_steps[StepCounter.step_index] != nil then
    StepCounter.step_line = scenario.raw_steps[StepCounter.step_index].line 
    #puts 'b4 scenario step: '+ scenario.raw_steps[StepCounter.step_index].keyword.to_s + ' ' + scenario.raw_steps[StepCounter.step_index].name.to_s
    if scenario.raw_steps[StepCounter.step_index].name.to_s.include? 'in Second Device' then
        $device = 2
        puts 'On the second device...'
        scenario.raw_steps[StepCounter.step_index].name.slice!(/ in Second Device$/)
    else
        $device = 1
    #    puts 'on the first device'
    end    
    #puts 'scenario step: '+ scenario.raw_steps[StepCounter.step_index].keyword.to_s + ' ' + scenario.raw_steps[StepCounter.step_index].name.to_s
  end

end

StepCounter = Class.new
class << StepCounter
  @step_index = 0
  @step_line = 0
  attr_accessor :step_index, :step_line
end

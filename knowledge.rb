class Module
def attribute(a, &block)

  if a.kind_of? Hash
    a, default=a.to_a.first 
  else
    default=nil
  end

  define_method(a) do 
    if instance_variables.include? "@#{a}".to_sym    
      instance_variable_get "@#{a}"
    else
      block ? instance_eval(&block) : default
    end
  end

  define_method("#{a}?") do 
    !!send(a)
    # if default==nil
    #   instance_variables.include? "@#{a}".to_sym  
    # else
    #   true
    # end
  end

  define_method("#{a}=") do |var|
    instance_variable_set "@#{a}", var
  end

end
end


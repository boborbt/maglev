# I've tweaked this a bit from the raw Rubinius.
# BEGIN RUBINIUS: From rubinius rubinius/kernel/core/kernel.rb
module Type

  ##
  # Returns an object of given class. If given object already is one, it is
  # returned. Otherwise tries obj.meth and returns the result if it is of the
  # right kind. TypeErrors are raised if the conversion method fails or the
  # conversion result is wrong.
  #
  # Equivalent to MRI's rb_convert_type().

  def self.coerce_to(obj, cls, meth)
    # this default implementation should only be used by non-bootstrap code
    return obj if obj.kind_of?(cls) 

    begin
      ret = obj.__send__(meth)
    rescue Exception => e
      raise TypeError, "Coercion error: #{obj.inspect}.#{meth} => #{cls} failed:\n" \
                       "(#{e.message})"
    end

    return ret if ret.kind_of?(cls)   # GEMSTONE mod

    raise TypeError, "Coercion error: obj.#{meth} did NOT return a #{cls} (was #{ret.class})"
  end

  # Sends to following methods are generated by optimization code in
  # class RubyCallNode  during AST to IR  translation .
  # The optimization translates a call such as
  #    x = Type.coerce_to(o , Integer, :to_int)
  # to
  #    x :=  o _isInteger ifTrue:[ o ]
  #                 ifFalse:[ Type.coerce_to_Integer_to_int(o) ]
  #
  def self.coerce_to_Array_to_ary(obj)
     begin
       ret = obj.to_ary
     rescue Exception => e
       raise TypeError, "Coercion error: #{obj.inspect}.to_ary => Array failed:\n" \
                       "(#{e.message})"
     end
     return ret if ret._isArray 
     raise TypeError, "Coercion error: obj.to_ary did NOT return an Array"
  end

  def self.coerce_to_Array_to_a(obj)
     begin
       ret = obj.to_a
     rescue Exception => e
       raise TypeError, "Coercion error: #{obj.inspect}.to_a => Array failed:\n" \
                       "(#{e.message})"
     end
     return ret if ret._isArray 
     raise TypeError, "Coercion error: obj.to_a did NOT return an Array"
  end

  def self.coerce_to_Fixnum_to_int(obj)
     begin
       ret = obj.to_int
     rescue Exception => e
       raise TypeError, "Coercion error: #{obj.inspect}.to_int => Fixnum failed:\n" \
                       "(#{e.message})"
     end
     return ret if ret._isFixnum 
     raise TypeError, "Coercion error: obj.to_int did NOT return an Fixnum"
  end

  def self.coerce_to_Float_to_f(obj)
     begin
       ret = obj.to_f
     rescue Exception => e
       raise TypeError, "Coercion error: #{obj.inspect}.to_f => Float failed:\n" \
                       "(#{e.message})"
     end
     return ret if ret._isFloat 
     raise TypeError, "Coercion error: obj.to_f did NOT return an Float"
  end
  
  def self.coerce_to_Hash_to_hash(obj)
     begin
       ret = obj.to_hash
     rescue Exception => e
       raise TypeError, "Coercion error: #{obj.inspect}.to_hash => Hash failed:\n" \
                       "(#{e.message})"
     end
     return ret if ret._isHash 
     raise TypeError, "Coercion error: obj.to_hash did NOT return a Hash"
  end

  def self.coerce_to_Integer_to_i(obj)
     begin
       ret = obj.to_i
     rescue Exception => e
       raise TypeError, "Coercion error: #{obj.inspect}.to_i => Integer failed:\n" \
                       "(#{e.message})"
     end
     return ret if ret._isInteger 
     raise TypeError, "Coercion error: obj.to_i did NOT return an Integer"
  end

  def self.coerce_to_Integer_to_int(obj)
     begin
       ret = obj.to_int
     rescue Exception => e
       raise TypeError, "Coercion error: #{obj.inspect}.to_int => Integer failed:\n" \
                       "(#{e.message})"
     end
     return ret if ret._isInteger 
     raise TypeError, "Coercion error: obj.to_int did NOT return an Integer"
  end

  def self.coerce_to_String_to_s(obj)
     begin
       ret = obj.to_s
     rescue Exception => e
       raise TypeError, "Coercion error: #{obj.inspect}.to_s => String failed:\n" \
                       "(#{e.message})"
     end
     return ret if ret._isString 
     raise TypeError, "Coercion error: obj.to_s did NOT return a String"
  end

  def self.coerce_to_String_to_str(obj)
     begin
       ret = obj.to_str
     rescue Exception => e
       raise TypeError, "Coercion error: #{obj.inspect}.to_str => String failed:\n" \
                       "(#{e.message})"
     end
     return ret if ret._isString 
     raise TypeError, "Coercion error: obj.to_str did NOT return a String"
  end

  def self.coerce_to_Symbol_to_sym(obj)
     begin
       ret = obj.to_sym
     rescue Exception => e
       raise TypeError, "Coercion error: #{obj.inspect}.to_sym => Symbol failed:\n" \
                       "(#{e.message})"
     end
     return ret if ret._isSymbol 
     raise TypeError, "Coercion error: obj.to_sym did NOT return a Symbol"
  end

end
# END RUBINIUS

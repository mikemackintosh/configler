require 'securerandom'
require 'openssl'
require 'paint'

require 'configler/version'
require 'configler/generator'
require 'configler/cli'

module Configler

  class MissingParameters < RuntimeError; end

  attr_writer :pkey, :private_key, :public_key

  class Create
    def initialize(options=nil)

      unless options.is_a? Hash
        fail Configler::MissingParameters,
          'Incorrect parameters passed to Configler::Create'
      end

    # Generate the p keys
      @pkey = Configler::Generator.pkey(options[:bits])
      
    # Look ma, I have keys
      @private_key = @pkey.to_pem
      @public_key = @pkey.public_key
    end

    def encrypt(contents)
      @encrypted = @pkey.private_encrypt(contents).unpack('H*')[0]
      @encrypted
    end

    def encrypted
      @encrypted
    end

    def decrypt(contents)
      packed = [contents].pack('H*')
      @decrypted = @pkey.public_decrypt(packed)
      @decrypted
    end

    def decrypted
      @decrypted
    end

    def public_key
      @public_key
    end

    def private_key
      @private_key
    end

    def test(contents)
      f = read('configler')
      if decrypt(contents).eql? decrypt(f)
        return true
      end

      false
    end

  # Save to file
    def save
      File.write('configled', @encrypted)
    end

  # Read an encrypted file
    def read(file)
      if File.exist? 'file'
        @encrypted = File.read(file)
      end

      @encrypted
    end

  end
end


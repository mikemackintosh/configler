module Configler
  module Generator
    class << self

  # Generate an ENV Variable
    def env
      "CONFIGLER_#{SecureRandom.hex[0..4].upcase}"
    end

  # Generate a password
    def password
      "#{OpenSSL::Digest::SHA256.new(SecureRandom.base64)}"
    end

  # Generate PKI
    def pkey(bits=2048)
      OpenSSL::PKey::RSA.new bits.to_i
    end

    end
  end
end
# encoding: UTF-8
class Meublog < ActiveRecord::Base
	validates :title, presence: { :message => "não pode ficar em branco." },
                    length: { minimum: 5 , :message => " deve ter no mínimo 5 caracteres."}
end

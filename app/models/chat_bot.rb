class ChatBot < ApplicationRecord
  def self.r_to(message)
    if message.present? && message.downcase.include?("привет")
      "Привет! Чем могу помочь?"
    elsif message.present? && message.downcase.include?("что говорить секретарю при входе?")
      "назовите свои данные в следующем порядке: направление, курс, ФИО, зачем пришли."
    else
      "Извините, я не знаю ответа на ваш вопрос. Попробуйте воспользоваться поиском на форуме или создать тему."
    end
  end
end


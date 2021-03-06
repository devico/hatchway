class WriteMessage
  def initialize(params)
    @a = params[:a]
    @a1 = params[:a1]
    @b = params[:b]
    @c = params[:c]
    @d = params[:d]
    @latitude = params[:latitude]
    @longitude = params[:longitude]
  end

  def create_message_text
    if @a
      message_text = <<EOF
Согласно п.п. 3.1.10, 3.1.11 ГОСТ Р 50597-93, люки смотровых колодцев и дождеприемников
должны соответствовать требованиям ГОСТ 3634, а согласно п. 3.1.12, устранение недостатков,
указанных в пп.3.1.9 и 3.1.10, следует осуществлять в течение не более суток с момента их
обнаружения, а разрушенные крышки и решетки должны быть немедленно ограждены и обозначены
соответствующими дорожными знаками и их замена должна быть проведена в течение не более 3 ч.
ГОСТ Р 50597-93 не регламентирует критериев аварийности, и устанавливает строгие
сроки устранения дефектов и несоответствий."

Координаты расположения люка:
широта: #{@latitude}
долгота: #{@longitude}
EOF
    end
    if @a1
      message_text = <<EOF
Согласно п.п. 3.1.10, 3.1.11 ГОСТ Р 50597-93, люки смотровых колодцев и дождеприемников
должны соответствовать требованиям ГОСТ 3634, а согласно п. 3.1.12, устранение недостатков,
указанных в пп.3.1.9 и 3.1.10, следует осуществлять в течение не более суток с момента их
обнаружения, а разрушенные крышки и решетки должны быть немедленно ограждены и обозначены
соответствующими дорожными знаками и их замена должна быть проведена в течение не более 3 ч.
ГОСТ Р 50597-93 не регламентирует критериев аварийности, и устанавливает строгие
сроки устранения дефектов и несоответствий."

"Крышка люка отклонена относительно уровня покрытия больше 2 см, что нарушает п 3.1.10 ГОСТ Р 50597-93."

Координаты расположения люка:
широта: #{@latitude}
долгота: #{@longitude}
EOF
    end
    if @b
      message_text = <<EOF
Между крышкой и корпуском зазоры, превышающие 3 мм, что нарушает п. 5.2.5 ГОСТ 3634-99.

Координаты расположения люка:
широта: #{@latitude}
долгота: #{@longitude}
EOF
    end
    if @c
      message_text = <<EOF
На крышке люка отсутствуют технические отверстия, что нарушает п.п. 5.2.6, 5.2.4 ГОСТ 3634-99.

Координаты расположения люка:
широта: #{@latitude}
долгота: #{@longitude}
EOF
    end
    if @d
      message_text = <<EOF
На крышке люка отсутствует маркировка с условным обозначением наименования инженерной сети,
типа люка, исполнения, размеров лаза и обозначения ГОСТ, что нарушает п.п. 5.5.1 и 4.5 ГОСТ 3634-99.

Координаты расположения люка:
широта: #{@latitude}
долгота: #{@longitude}
EOF
    end

    return { message: message_text }
  end
end

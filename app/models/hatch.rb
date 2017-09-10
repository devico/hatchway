class Hatch < ApplicationRecord
  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON

  validate :geo_present?
  validate :any_present?

  def geo_present?
    if %w(latitude longitude).all?{|attr| self[attr].blank?}
      errors.add :base, "Включите геолокацию, не определены широта и долгота"
    end
  end

  def any_present?
    if %w(a a1 b c d).all?{|attr| self[attr].blank?}
      errors.add :base, "Один из чекбоксов должен быть выбран"
    end
  end
end

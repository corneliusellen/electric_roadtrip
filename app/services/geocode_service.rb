class GeocodeService
  attr_reader :lat, :long

  def initialize(address=nil)
    @address = address
    @lat = nil
    @long = nil
  end

  def geocode
    response = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{@address}&key=#{ENV['GOOGLE_GEOCODE_KEY']}")
    lat_long = JSON.parse(response.body)["results"].first["geometry"]["location"]
    @lat = lat_long["lat"]
    @long = lat_long["lng"]
  end

  def get_linestring(start_address, end_address)
    convert_to_string(decode_WKB)
  end

  def decode_WKB
    encoded_path = "gbo~Fbs~uOCaIwA?sGJaLFaPPeFDMgT_@cOA_C_DZiVdAaLrAuHZkOCwUNgHb@sEvAaK~FqE|EiWza@mIzNkIxIgLnFsGbCwIlBeVGsE|A{CrBeMvM{_@dScEtC{KdNuTvd@}Tpe@scA~uBkVvi@eE|JeBfKuA`HuCjG{BnC_DzBgRpJoC|CuCjHcM`YeYfm@aW~i@uI`PcH`JiIpK}E|C}LjAoa@|@kTPsHeAiGuAaHFkGfCgEtDwLnKeHlDgIj@oMk@s[uAoG_AmN}DqNiCo_@c@iKn@uNpEaLvIwFpHqOd\\mT|e@wHpKsFpEeKzEwHtAqVFoO_@iJuBwIqEmG{FiK{J{KaFiJ{Aa[]wXk@sGsAsI{DoGkF}NeOmLsGcJ_BmLTkIxBkTdLeK`DaKr@q`@Ssg@?}JlByO~Hoo@j^uZzPcPfJwJfH}PbLePnIawAru@eHrB{Kx@{GXuKhBmL|EiTxOkFxCcBj@sFdAmEhAcFjEyBnFq@hF[pxANfUpEx~@dAvZa@dKcAjHqCdKkRbj@_DjSYtgD_@xGyAlFwAbC}DzCkFz@{ZAqd@]o_A_@ePz@eMbBaYlHgSfJkOvJmy@rl@kMxHs_@|MwhA~_@cw@bXsIjBeR~@ay@GuvAK}Ml@sI~A_LvDeL~G{q@ze@eKbHuHvCqFr@yFA}C[_LyDod@{Vs^mSwPeHgQmCmLE_r@~Fw_BtNoMjAaLnB}G|BcI`EwGxEag@bd@yz@~u@uj@jg@_\\vYmLdJsQhIkjAzc@gUzI}[dLwIhAeITgyAoCqmCgFiLjBgGdDaIvG}_@pZ{FvBcHtAuPbDe{@rPmq@rMat@`NiEHmF_@sFwA{EcCgEoDyDaF{BeEgE}MmPwn@{D{G_FiEcFmB_M}@aJNwJbAqI`B}s@xT{QxAikAt@aeBpA{v@^qzDpBu{@T}r@Nq|@aAmt@kAkMC}]AqfAt@u|Dr@g{DbAoVTuf@tBcxC\\{lAJqiDb@keD{AimBqA_^Fqp@_AuWa@}bBo@a[]_KaA}HiBmMcHoEmE_KyNoZqd@mHgHeFiCaKqBs~@oAo|IiK_kB_AehAg@yYo@gRkAiQViG}@_CqAkDuEoB}Fg@kEyA{a@sAw\\u@wFcCgHsCqD}DcCyFu@}UTuIJyX|CcH^uCQcKuC{KsEiEcAqG?qo@pDw[`EgNDqx@ScYB{FdA{Al@gG|EeBxBmDvEiGdF_NrDcOpDaL`AsLBgJD}D~@kDxAsJpBg@oYBoGHsv@SwJCeCG{BuAHwBLcAF"
    GoogleMapsService::Polyline.decode(encoded_path)
  end

  def get_route
    array = decode_WKB
    array.map do |point|
      point.values.reverse
    end
  end

  def convert_to_string(array)
    array.map do |hash|
      hash.values.reverse.join(" ") + ","
    end.join(" ")
  end
end

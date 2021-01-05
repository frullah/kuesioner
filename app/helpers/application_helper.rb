# frozen_string_literal: true

module ApplicationHelper
  def render_menus
    return unless current_user

    menus = case current_user.authenticatable_type
    when "Admin"
      [
        {
          text: "Data Mata Kuliah",
          link: mata_kuliahs_path
        },
        {
          text: "Data Prodi",
          link: prodis_path
        },
        {
          text: "Data Kelas",
          link: kelas_index_path
        },
        {
          text: "Data Tahun Akademik",
          link: tahun_akademiks_path
        },
        {
          text: "Data Mahasiswa",
          link: mahasiswas_path
        },
        {
          text: "Data Dosen",
          link: dosens_path
        },
        {
          text: "Data Kategori Kuesioner",
          link: kategori_kuesioners_path
        },
        {
          text: "Data Item Kuesioner",
          link: item_kuesioners_path
        },
        {
          text: "Laporan Hasil Kuesioner",
          link: "/#laporan-hasil-kuesioner"
        }
      ]
    when "Dosen"
      [
        {
          text: "Laporan Hasil Kuesioner",
          link: "/#laporan-hasil-kuesioner"
        }
      ]
    else
      [
        {
          text: "Isi Kuesioner",
          link: "/#isi-kuesioner"
        }
      ]
    end

    render_menu menus
  end

  private

  def render_sidebar_menu(menu)
    <<~HTML.html_safe
      <li class="nav-item">
        #{simple_active_link_to(menu[:text], menu[:link], {class: "nav-link", active_disable: :hash})}
      </li>
    HTML
  end

  def render_menu(menus)
    menus.map { |menu| render_sidebar_menu(menu) }.join.html_safe
  end
end

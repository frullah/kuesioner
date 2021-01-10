# frozen_string_literal: true

module ApplicationHelper
  def render_menus
    return unless current_user

    menus = case current_user.authenticatable_type
    when "Admin"
      [
        {
          text: "Data",
          items: [
            {
              text: "Prodi",
              link: prodis_path
            },
            {
              text: "Tahun Akademik",
              link: tahun_akademiks_path
            },
            {
              text: "Kelas",
              link: kelas_index_path
            },
            {
              text: "Mahasiswa",
              link: mahasiswas_path
            },
            {
              text: "Dosen",
              link: dosens_path
            },
            {
              text: "Mata Kuliah",
              link: mata_kuliahs_path
            },
            {
              text: "Jadwal Mata Kuliah",
              link: jadwal_mata_kuliahs_path
            },
            {
              text: "Kategori Kuesioner",
              link: kategori_kuesioners_path
            },
            {
              text: "Item Kuesioner",
              link: item_kuesioners_path
            }
          
          ]
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
          link: kuesioner_path
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
    menus.map do |menu|
      next render_sidebar_menu(menu) if menu[:items].blank?
      
      <<~HTML.html_safe
        <li class="nav-item has-treeview">
          <a href="#" class="nav-link">
            <p>
              #{menu[:text]}
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            #{render_menu menu[:items]}
          </ul>
        </li>
      HTML
    end.join.html_safe
  end
end

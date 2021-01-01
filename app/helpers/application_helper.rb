module ApplicationHelper
  def render_menus
    return unless current_user

    menus = case current_user.authenticatable_type
    when "Admin"
      [
        {
          text: "Data Mata Kuliah",
          link: "/#mata-kuliah"
        },
        {
          text: "Data Prodi",
          link: prodis_path
        },
        {
          text: "Data Mahasiswa",
          link: "/#mahasiswa"
        },
        {
          text: "Data Dosen",
          link: "/#dosen"
        },
        {
          text: "Data Kategori Kuesioner",
          link: "/#kategori-kuesioner"
        },
        {
          text: "Data Item Kuesionr",
          link: "/#item-kuesioner"
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

  def render_sidebar_menu_link(menu)
    options = {
      class: "nav-link"
    }

    <<~HTML.html_safe
      <li class="nav-item">
        #{simple_active_link_to(menu[:text], menu[:link], options)}
      </li>
    HTML
  end

  def render_menu(menus)
    menus.map { |menu|
      render_sidebar_menu_link(menu)
    }.join.html_safe
  end
end

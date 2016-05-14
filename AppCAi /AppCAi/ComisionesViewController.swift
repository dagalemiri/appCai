//
//  ComisionesViewController.swift
//  AppCAi
//
//  Created by David Galemiri on 30-12-15.
//  Copyright © 2015 David Galemiri. All rights reserved.
//

import UIKit

class ComisionesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var controller: UIViewController!
    var Descripcion = String()
    var NombreComision = String()
    
    
    
    let Comisiones = ["Vida Universitaria","Sustentabilidad","Comunidad","Proyectos","Política y Actualidad","Docencia","Responsabilidad Social","Cultura","Deportes","Emprendimiento","Comunicaciones"]
    let ComisionesYDescripciones = ["Vida Universitaria":"La comisión de vida universitaria se encarga de realizar actividades de distensión para lograr unir a la comunidad, estrechando lazos entre los miembros de la escuela de distintas generaciones y fomentando el bienestar entre sus pares fuera de la sala de clases. Alguno de los proyectos que organiza esta comisión son la Semana San Agustín, TropiCAi, entre otros.","Sustentabilidad":"La comisión de sustentabilidad tiene la misión de crear una cultura sustentable en la comunidad de Ingeniería, entendiendo esto como un trabajo continuo, y no solo de eventos aislados, centrado en el cuidado del medio ambiente. Se trabajará en conjunto con CVerde y se realizarán actividades que fomenten la conciencia sustentable dentro y fuera de la sala de clases, como la semana de la sustentabilidad, fomentar en los distintos departamentos una cultura verde y eventos CAi más sustentables. Promoviendo siempre la Reducción, Reutilización y  Reciclaje de nuestros recursos en la Escuela. ","Comunidad":"Esta comisión tiene como objetivo fortalecer la unión interna y crear una comunidad en la que todos se sientan parte importante reconociendo el rol que cumple cada uno de sus integrantes, considerando alumnos, profesores y funcionarios. Se encargará de crear espacios de encuentro y conversación fuera del área de trabajo y estudio, tales como los almuerzos de “conoce a tu comunidad”, la semana San Agustín y la gala. La comisión de novatos, que se encargará de recibirlos en las matrículas, pasará a ser parte de la comisión de comunidad, para no segregar entre novatos y comunidad.","Proyectos":"La comisión de proyectos tiene como objetivo generar lazos entre los proyectos de Ingeniería para que exista una buena relación entre ellos, esto mediante la organización de encuentros donde se puedan conocer unos a los otros como talleres, almuerzos, Semana de Proyectos, Carrete Interproyecto y Liga Interproyecto. Siguiendo con esta línea de trabajo el nuevo desafío para la comisión este año será proponer proyectos en los cuales se busque colaboración entre los Proyectos de Ingeniería y el CAi, para generar una política de trabajo en conjunto de estos que continúe a futuro con miras a propuestas Interproyecto más ambiciosas. ","Política y Actualidad":"La comisión de Política y Actualidad tiene como objetivo promover instancias de discusión y reflexión al interior de la Escuela, buscando que los estudiantes se interesen y se informen sobre temas de contingencia, se hagan parte de los espacios de participación y se fomente el desarrollo de pensamiento crítico en el alumnado, entendiendo que es algo fundamental en nuestra formación como ingenieros. Algunos ejemplos concretos de actividades impulsadas desde esta comisión son intervenciones en el patio, charlas, debates y conversatorios sobre temas relevantes a nivel universidad, así como a nivel nacional e internacional. El año que viene estará marcado por la discusión sobre diversos temas de interés público y es clave propiciar desde el Centro de Alumnos que la comunidad de ingeniería no se reste de la reflexión y sea capaz de levantar una opinión crítica e informada sobre estos asuntos. ","Docencia":"La comisión de Docencia tiene como objetivo lograr una academia de excelencia, una comunidad educativa más cercana y trabajar en la formación de ingenieros integrales. Para lograrlo se buscará trabajar el próximo año en mejorar la evaluación docente, revisar el plan de estudios y los sistemas de evaluación y toma de ramos. Algunos de los proyectos de la comisión son Escuela Backstage, trabajar junto al Cuerpo de Ayudantes y potenciar las Investigaciones en Pregrado, además de nuevos proyectos como Seguimiento a Causales de eliminación, Semana “Salvemos al Mundo” y Massive Online Open Course (MOOC).","Responsabilidad Social":"La comisión de Responsabilidad Social tiene como objetivo realizar actividades de comprensión y conciencia sobre la sociedad en la que vivimos, involucrando a la comunidad y promoviendo la empatía y el respeto. Se trabajará en conjunto con CeCai(Centro de estudios Cai) para una mayor comprensión caracterización de la comunidad. Se realizarán actividades tales como el dato social/consciente del mes, la semana de la conciencia, el Camp de Ideas Sociales, fomentar las prácticas sociales, jornada interdisciplinaria de discusión, opinión e ideas concretas sobre temáticas sociales.","Cultura":"La comisión de Cultura tiene como objetivo crear espacios de distensión en los que las personas puedan compartir y generar comunidad a partir de la difusión de la cultura y las artes. Se encarga de entregar instancias y oportunidades para que los miembros de la comunidad puedan mostrar distintas facetas, más allá de lo “ingenieril” y así acercar la cultura y las artes a la Escuela y Universidad. Algunos de los eventos que organiza esta comisión son Woodstock UC, CAifé Concert, Ingeniería en 100 palabras, entre otros.","Deportes":"La comisión de Deportes tiene como misión velar por la vida sana y la recreación de la comunidad, como también generar un sentido de pertenencia con la escuela y la UC.Para lograr esto, se mejorarán las instancias que actualmente existen, trabajando en conjunto con el plan deportivo para poder crear nuevas selecciones como la de tenis y también crear nuevas ligas como la de voleyball. Además, se mejorarán las ligas actuales con la ayuda de auspiciadores y más difusión. También se realizarán los primeros juegos de Ingenieria en conjunto con el Plan Deportivo. Por otro lado se quiere fomentar la vida sana a través de una feria deportiva y también una feria deportiva outdoor. Por último, se podrán realizar distintos eventos deportivos y generar nuevas ideas para poder llevar el deporte hacia los alumnos de Ingeniería.","Emprendimiento":"La comisión de Emprendimiento tiene como misión fomentar el espíritu emprendedor en la comunidad y además ayudar a toda persona que quiera emprender. Para esto es que nos queremos aliar con el currículum invisible y poder crear un taller de emprendimiento para la comunidad en conjunto con decanato. Además, queremos seguir en conjunto con responsabilidad social para seguir con el Camp de Ideas Sociales. También queremos realizar Emprendedores On Stage y realizar el mes del emprendimiento en conjunto con decanato. Por otro lado, queremos realizar un congreso sobre emprendimiento y un coaching de emprendimiento con la comunidad. Por último, al ser una comisión de emprendimiento, se deja abierto todo a cambio y nuevos proyectos.","Comunicaciones":"La comisión de comunicaciones tiene como objetivo lograr una correcta comunicación de todas las actividades que se realizan. Esto es, lograr una buena comunicación previa, durante y posterior. Para esto, es necesario realizar materiales gráficos de calidad, un manejo constante de las redes sociales y mantener la información actualizada. Además, es necesario mirar a nuevas alternativas de difusión y comunicación de forma creativa, para intentar llegar a la mayor cantidad de personas posibles"]


    
    
    var Indice = NSIndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
        controller = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Comisiones.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("a") as! ComisionesTableViewCell
        cell.textLabel?.text = Comisiones[indexPath.row]

        switch Comisiones[indexPath.row] {
        case "Comunidad":
            cell.imageView?.image =  UIImage(named: "LogoComunidad")
        case "Vida Universitaria":
            cell.imageView?.image = UIImage(named: "LogoVidaUniversitaria")
        case "Sustentabilidad":
            cell.imageView?.image =  UIImage(named: "LogoSustentabilidad")
        case "Deportes":
            cell.imageView?.image = UIImage(named: "LogoDeportes")
        case "Docencia":
            cell.imageView?.image = UIImage(named: "LogoDocencia")
        case "Emprendimiento":
            cell.imageView?.image = UIImage(named: "LogoEmprendimiento")
        case "Política y Actualidad":
            cell.imageView?.image = UIImage(named: "LogoPolitica")
        case "Responsabilidad Social":
            cell.imageView?.image = UIImage(named: "LogoRSU")
        case "Proyectos":
            cell.imageView?.image = UIImage(named: "LogoProyectos")
        case "Cultura":
            cell.imageView?.image = UIImage(named: "LogoCultura")
        case "Comunicaciones":
            cell.imageView?.image = UIImage(named: "LogoComunicaciones")
        default:
            cell.imageView?.image = UIImage(named: "inicio")
        }
        return cell
    }
    
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        Indice = NSIndexPath(forRow: indexPath.row, inSection: 0)
            let Alerta = UIAlertController(title: "¿Deseas unirte a la comisión de "+self.Comisiones[Indice.row], message: self.ComisionesYDescripciones[self.Comisiones[Indice.row]], preferredStyle: UIAlertControllerStyle.Alert)
            
            Alerta.addAction(UIAlertAction(title: "SI :)!", style: .Default, handler: { (action: UIAlertAction!) in print("Handle Ok logic here")
            }))
            Alerta.addAction(UIAlertAction(title: "NO :(", style: .Default, handler: { (action: UIAlertAction!) in print("Handle Cancel Logic here")
            }))
            presentViewController(Alerta, animated: true, completion: nil)

        return indexPath
    }
    

}

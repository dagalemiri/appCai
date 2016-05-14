//
//  EventosTotalesViewController.swift
//  AppCAi
//
//  Created by David Galemiri on 31-12-15.
//  Copyright © 2015 David Galemiri. All rights reserved.
//

import UIKit

class EventosTotalesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var controller:UIViewController!
    
    @IBOutlet var Open: UIBarButtonItem!
    
    var imagenes = [NSNumber:UIImage]()
    
    var ListaTodosLosEventos:[TablaEventos] = []
    var ListaEventos:[TablaEventos] = []
    var Indice:NSIndexPath!
    var UltimoEventoDescargado:Int!
    var OpcionTabla = 0
    var LabelTable = "Todos los eventos"
    var refreshControl = UIRefreshControl()
    
/*    func makePullToRefreshToTableView(tableName: UITableView,triggerToMethodName: String){
        
        refreshControl.attributedTitle = NSAttributedString(string: "TEST: Pull to refresh")
        refreshControl.backgroundColor = UIColor.whiteColor()
        refreshControl.addTarget(self, action: Selector(triggerToMethodName), forControlEvents: UIControlEvents.ValueChanged)
        tableName.addSubview(refreshControl)
    }
    func makePullToRefreshEndRefreshing (tableName: String)
    {
        refreshControl.endRefreshing()
        //additional codes
        
    }

    override func viewWillAppear(animated: Bool) {
        
        self.makePullToRefreshToTableView(TableView, triggerToMethodName: "pullToRefreshBidderTable")
    }
    
    func pullToRefreshBidderTable() {
        self.GETTodosLosEventos()
        self.makePullToRefreshEndRefreshing("bidderListTable")
        //Code What to do here.
       
        
        
    }*/
    
    override func viewDidLoad() {
        self.navigationItem.title = self.LabelTable
        super.viewDidLoad()
        print(LabelTable)
        controller = self
        TableView.dataSource = self
        TableView.delegate = self
        self.FetchTodosLosEventos()
        self.FiltrarEventos()
        Open.target = self.revealViewController()
        Open.action = Selector("revealToggle:")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.refreshControl.addTarget(self, action: "refresh", forControlEvents: .ValueChanged)
        
        self.TableView.addSubview(refreshControl)

        
        
        
        self.TableView.setNeedsLayout()
        self.TableView.layoutIfNeeded()
        
      
     //   TableView.addSubview(refreshControl)
        
        
      /*  refreshControl.addTarget(self, action: Selector("sortArray"), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = refreshControl*/

        
   
    }
    
    func refresh(){
          self.GETTodosLosEventos()
    }
    
  /*  func sortArray() {
        var sortedAlphabet = alphabet.reverse()
        
        for (index, element) in enumerate(sortedAlphabet) {
            alphabet[index] = element
        }
        
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }*/
    

    
    @IBAction func RefrescarEventos(sender: AnyObject) {
        
        
        // notificacion funcional
       /* let localNotification = UILocalNotification()
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 5)
        localNotification.alertBody = "Hola!"
        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        localNotification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)*/
        
        var aux = 0
        for i in ListaTodosLosEventos{
            if Int(i.idEvento!) > aux  {
                aux = Int(i.idEvento!)
            }
        }
        
        self.UltimoEventoDescargado = aux
        print(self.UltimoEventoDescargado)
        
        
        GETTodosLosEventos()
        FetchTodosLosEventos()
    }
    
    func FetchTodosLosEventos(){
        ListaTodosLosEventos = []
        self.ListaTodosLosEventos = Estaticos.Fetch("TablaEventos") as! [TablaEventos]

        
    }
    
    func ordenar(){
    
     //   self.fechaEvento(self.ListaEventos[Indice.section].diaInicio!,fechaInicio: self.ListaEventos[Indice.section].fechaInicio!,horaInicio: self.ListaEventos[Indice.section].horaInicio!)
        
        self.ListaEventos = self.ListaEventos.sort({($0.fechaInicio!.toDateTime()).compare($1.fechaInicio!.toDateTime()) == NSComparisonResult.OrderedDescending})
        
    
        
        
    
    
    }
    func ordenarPorDia(){}
    func ordenarPorHora(){}
    
    
    
    func FiltrarEventos(){
        ListaEventos = []
        switch OpcionTabla{
        case 0:
            self.ListaEventos = self.ListaTodosLosEventos
            self.ordenar()
            
            
            for a in self.ListaEventos{
               // self.imagenes[a.idEvento!] = nil
            }
            
            
            
            
        case 1:
            for Evento in ListaTodosLosEventos{
                if let palanca = Usuario.GetMisComisiones()[Evento.nombreComision!]{
                    if palanca {
                        self.ListaEventos.append(Evento)
                    }
                    
                }
            }
        default:
            for Evento in ListaTodosLosEventos{
                if Evento.nombreComision == LabelTable {
                    self.ListaEventos.append(Evento)
                }
            }
        }
    }
    

    
    func GETTodosLosEventos() {


     /*   var messageFrame = UIView()
        var activity = UIActivityIndicatorView()
        var strLabel = UILabel()
        
        
        strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 90, height: 50))
        strLabel.text = "Cargando"
        strLabel.textColor = UIColor.whiteColor()
        messageFrame = UIView(frame: CGRect(x: self.view.frame.midX - 90, y: self.view.frame.midY - 25 , width: 150, height: 50))
        messageFrame.layer.cornerRadius = 15
        messageFrame.backgroundColor = UIColor(white: 0, alpha: 0.7)
        activity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.White)
        activity.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activity.startAnimating()
        messageFrame.addSubview(activity)
        messageFrame.addSubview(strLabel)
        self.view.addSubview(messageFrame)
      //  self.disableTouchesOnView:parentView
        view.userInteractionEnabled = false
        
        
        if  let arrayOfTabBarItems = self.tabBarController!.tabBar.items as! AnyObject as? NSArray{
            for element in arrayOfTabBarItems {
                var item = element as! UITabBarItem
                item.enabled = false
            }
        }
        */
        
        
        
        
        
        
        
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://api.cai.cl/eventos")!)
        request.HTTPMethod = "GET"
        
        
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data, response, error in
            
            

            
            
            
            if error != nil {
                print("ERROR \(error)")
                
               // messageFrame.removeFromSuperview()
               // self.view.userInteractionEnabled = true
                
                
               /* if  let arrayOfTabBarItems = self.tabBarController!.tabBar.items as! AnyObject as? NSArray{
                    for element in arrayOfTabBarItems {
                        var item = element as! UITabBarItem
                        item.enabled = true
                    }
                }*/
                
                
                
                let Alerta = UIAlertController(title: "Error", message: "Ocurrió un problema al cargar los contenidos, por favor revise su conexión a internet", preferredStyle: UIAlertControllerStyle.Alert)
                Alerta.addAction(UIAlertAction(title: "Continuar", style: .Default, handler: { (action: UIAlertAction!) in print("Handle Ok logic here")
                }))
                self.presentViewController(Alerta, animated: true, completion: nil)
              
                

                return
           }
           else {
                print(data)
                let jsonSwift: AnyObject? = try? NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
                if let jsonArray = jsonSwift as? NSArray {
                    for jsonMensaje in jsonArray {
                        if let jsonDictionary = jsonMensaje as? Dictionary<String, NSObject> {
                            let idEvento = jsonDictionary["id"] as! Int
                            let nombreEvento = jsonDictionary["nombre"] as! String
                            let descripcion = jsonDictionary["descripcion"] as! String
                            let horaInicio = jsonDictionary["hora_inicio"] as! String
                            let diaInicio = jsonDictionary["dia_inicio"] as! String
                            let fechaInicio = jsonDictionary["fecha_inicio"] as! String
                            let categoria = jsonDictionary["categoria"]
                            let imagenURL = jsonDictionary["imagen"] as! String
                            if let comisionDictionary = categoria as? Dictionary<String, NSObject> {
                                let idComision = comisionDictionary["id"] as! Int
                                let nombreComision = comisionDictionary["etiqueta"] as! String
                                TablaEventos.createInManagedObjectContext(Estaticos.moc(), nombreComision: nombreComision, nombreEvento: nombreEvento, descripcion: descripcion, idEvento: idEvento, idComision: idComision, horaInicio: horaInicio, diaInicio:  diaInicio, fechaInicio:  fechaInicio,imagenURL:imagenURL)
                            }
                         //   self.FetchTodosLosEventos()
                        }
                    }
                }
                
              //  self.FetchTodosLosEventos()
                
               // self.FetchTodosLosEventos()
               
                
              /*  dispatch_async(dispatch_get_main_queue(), {
                    self.TableView.reloadData()})*/
              //  messageFrame.removeFromSuperview()
              //  self.view.userInteractionEnabled = true
                
                
            /*    if  let arrayOfTabBarItems = self.tabBarController!.tabBar.items as! AnyObject as? NSArray{
                    for element in arrayOfTabBarItems {
                        var item = element as! UITabBarItem
                        item.enabled = true
                    }
                }*/
                
          }
            dispatch_async(dispatch_get_main_queue(), {
               
               // if self.refreshControl.refreshing == false {
                    Estaticos.save()
                    self.FetchTodosLosEventos()
                    self.FiltrarEventos()
                    self.TableView.reloadData()
                 self.refreshControl.endRefreshing()
              //  }
                
                
               // self.viewWillAppear(false)
            })
        }
        task.resume()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fechaEvento(diaInicio:String, fechaInicio: String, horaInicio:String) -> String{
        var fecha = ""
        var mes = ""
        
        switch diaInicio{
            case "Monday":
                fecha += "Lunes"
            case "Tuesday":
                fecha += "Martes"
            case "Wednesday":
                fecha += "Miercoles"
            case "Thursday":
                fecha += "Jueves"
            case "Friday":
                fecha += "Viernes"
            case "Saturday":
                fecha += "Sabado"
            default:
                fecha += "Domingo"
        }
        
        switch fechaInicio[3...4]{
        case "01":
            mes += "enero"
        case "02":
            mes += "febrero"
        case "03":
            mes += "marzo"
        case "04":
            mes += "abril"
        case "05":
            mes += "mayo"
        case "06":
            mes += "junio"
        case "07":
            mes += "julio"
        case "08":
            mes += "agosto"
        case "09":
            mes += "septiembre"
        case "10":
            mes += "octubre"
        case "11":
            mes += "noviembre"
        default:
            mes += "diciembre"
        }
        
        fecha += " " + fechaInicio[0...1] + " de " + mes + " | "
        
        
        fecha += horaInicio[0...4]
        
        
        
        
        return fecha
    }
    
    

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("EventosTotalesTableViewCell") as! EventosTotalesTableViewCell
            cell.NombreEvento.text = self.ListaEventos[indexPath.section].nombreEvento
            cell.NombreComision.text = self.ListaEventos[indexPath.section].nombreComision
            cell.Texto.frame = CGRect(x: 2, y: 2, width: self.view.frame.width-2, height: 400)
            cell.Texto.text = self.ListaEventos[indexPath.section].descripcion
            cell.a.text = self.ListaEventos[indexPath.section].descripcion
            NSLog(self.ListaEventos[indexPath.section].imagenURL!)
        
          /*  if let data = NSData(contentsOfURL: self.ListaEventos[indexPath.section].imagenURL!){
            // se instancia la imagen a partir de "data"
            let i = UIImage(data: data)
            }*/

            // instancia del URI
            let url = NSURL(string: self.ListaEventos[indexPath.section].imagenURL!)
        
            // instancia del request a partir del URI
            let request = NSMutableURLRequest(URL:url!)
        
            // asignar el método GET al request
            request.HTTPMethod="GET"
            if self.ListaEventos[indexPath.section].imagenURL! == "https://www.cai.cl//public//images//no-foto-300px.png" {
            }
            else {
                let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data,     response, error in
                    if error != nil {
                        NSLog("Error")
                    }
                    else {
                        let i = UIImage(data: data!)
                        NSLog("\(indexPath.section)")
                        NSLog("\(self.ListaEventos[indexPath.section].idEvento!)")
                        if i != nil {
                        self.imagenes[self.ListaEventos[indexPath.section].idEvento!] = i!
                        dispatch_async(dispatch_get_main_queue()) {
                            cell.Imagen.image = self.imagenes[self.ListaEventos[indexPath.section].idEvento!]!
                        }
                        }
                    }
                }
                task.resume()
            }
        
        //let fixedWidth = cell.Texto.frame.size.width
        
      /*  let fixedWidth = self.view.frame.width-2
        cell.Texto.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        let newSize = cell.Texto.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        var newFrame = cell.Texto.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        cell.Texto.frame = newFrame;*/
        
        
        
        cell.FechaEvento.text = self.fechaEvento(self.ListaEventos[indexPath.section].diaInicio!,fechaInicio: self.ListaEventos[indexPath.section].fechaInicio!,horaInicio: self.ListaEventos[indexPath.section].horaInicio!)
        
        
        
        
            //cell.FechaEvento.text = self.ListaEventos[indexPath.section].diaInicio! + " " + self.ListaEventos[indexPath.section].fechaInicio! + " | " + self.ListaEventos[indexPath.section].horaInicio!
          /*  if cell.NombreComision.text != "Comunidad"{
                cell.Imagen.image = UIImage(named: "VU2")
            }
            else {
                cell.Imagen.image = UIImage(named: "VU1")
            }*/
        
        switch cell.NombreComision.text! {
        case "Comunidad":
            cell.Imagen.image = UIImage(named: "VU2")
        default:
            cell.Imagen.image = UIImage(named: "VU1")
        }
        
            return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return ListaEventos.count
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "descripcion"{
            let controlador = segue.destinationViewController as! DescripcionEventoViewController
            controlador.NombreComisionContent = ListaEventos[Indice.section].nombreComision!
            controlador.NombreEventoContent = ListaEventos[Indice.section].nombreEvento!
            controlador.DescripcionContent = ListaEventos[Indice.section].descripcion!
            controlador.FechaContent = self.fechaEvento(self.ListaEventos[Indice.section].diaInicio!,fechaInicio: self.ListaEventos[Indice.section].fechaInicio!,horaInicio: self.ListaEventos[Indice.section].horaInicio!)
            

        }
    }

    
        
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        Indice = indexPath
        print(Indice.row)
        
        //controller.performSegueWithIdentifier("Descripcion", sender: controller)
        return indexPath
    }
    
   /*func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.ListaEventos[section].nombreEvento
    }*/
        
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

   /* func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
       /* var myCustomView = UIImageView()
        var myImage: UIImage = UIImage(named: "book.png")!
        myCustomView.image = myImage*/
        
        let header = UIView()
        header.backgroundColor = UIColor.whiteColor()
        let equiqueta = UILabel()
        equiqueta.text = "joad"
        header.addSubview(etiqueta)
        //header.addSubview(myCustomView)
        return header
    }*/
    
    
    
    
    
    
    
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
         let  headerCell = tableView.dequeueReusableCellWithIdentifier("header") as! HeaderEventosTableViewCell
        // headerCell.Evento.text = self.ListaEventos[section].nombreEvento
         //headerCell.Imagen = UIImageView(image: UIImage(named: "gear.png"))
        
        switch ListaEventos[section].nombreComision! {
            case "Comunidad":
                headerCell.imageView?.image = UIImage(named: "LogoComunidad")
            case "Vida Universitaria":
                headerCell.imageView?.image = UIImage(named: "LogoVidaUniversitaria")
            case "Sustentabilidad":
                headerCell.imageView?.image = UIImage(named: "LogoSustentabilidad")
            case "Cultura":
                headerCell.imageView?.image = UIImage(named: "LogoCultura")
            default:
                headerCell.imageView?.image = UIImage(named: "inicio")
        }
        /*if ListaEventos[section].nombreComision == "Comunidad" {
            headerCell.imageView?.image = UIImage(named: "ajustes")
        }
        else {
            headerCell.imageView?.image = UIImage(named: "inicio")
        }*/
        
        headerCell.textLabel?.text = self.ListaEventos[section].nombreEvento
        
         return headerCell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
     /*   if Array(seleccionados.keys).contains(indexPath) {
            if seleccionados[indexPath] != nil {
                if seleccionados[indexPath] == true {
                    return 800
                }
                else if seleccionados[indexPath] == false {
                    seleccionados.removeValueForKey(indexPath)
                    return 500
                }
        }
        
    }*/
        return 400
    }
    
    var seleccionados = [NSIndexPath:Bool]()
   
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if Array(seleccionados.keys).contains(indexPath) {
            seleccionados[indexPath] = false
        }
        else {
            seleccionados[indexPath] = true
        }
        
        if seleccionados.count > 0 {
           // self.TableView.reloadRowsAtIndexPaths(Array(seleccionados.keys), withRowAnimation: UITableViewRowAnimation.Automatic)
            self.TableView.reloadData()
        }
        

        
        
     /*   let previousIndexPath = selectedIndexPath
        if indexPath == selectedIndexPath{
            selectedIndexPath = nil
        }
        else{
            selectedIndexPath = indexPath
        }
        
        var indexPaths : Array<NSIndexPath> = []
        if let previous  = previousIndexPath {
            indexPaths += [previous]
        }
        if let current  = selectedIndexPath {
            indexPaths += [current]
        }
        
        if indexPaths.count > 0 {
            self.TableView.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
        }*/

    }
    
    
   /*
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        (cell as! EventosTotalesTableViewCell).watchFrameChanges()
    }
    
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        (cell as! EventosTotalesTableViewCell).ignoreFrameChanges()
    }*/
    
   /* func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }*/
    
   /* override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        let contentSize = self.myTextViewTitle.sizeThatFits(self.myTextViewTitle.bounds.size)
        var frame = self.myTextViewTitle.frame
        frame.size.height = contentSize.height
        self.myTextViewTitle.frame = frame
        
        aspectRatioTextViewConstraint = NSLayoutConstraint(item: self.myTextViewTitle, attribute: .Height, relatedBy: .Equal, toItem: self.myTextViewTitle, attribute: .Width, multiplier: myTextViewTitle.bounds.height/myTextViewTitle.bounds.width, constant: 1)
        self.myTextViewTitle.addConstraint(aspectRatioTextViewConstraint!)
        
    }*/
    
    func textViewDidChange(textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.frame = newFrame;
    }

   
    

}

extension String {
    
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = startIndex.advancedBy(r.startIndex)
        let end = start.advancedBy(r.endIndex - r.startIndex)
        return self[Range(start ..< end)]
    }
    
        func toDateTime() -> NSDate
        {
            //Create Date Formatter
            let dateFormatter = NSDateFormatter()
            //Specify Format of String to Parse
           // dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:SS"
            dateFormatter.dateFormat = "dd/MM/yyyy"
            
            //Parse into NSDate
            let dateFromString : NSDate = dateFormatter.dateFromString(self)!
            
            //Return Parsed Date
            return dateFromString
        }
}

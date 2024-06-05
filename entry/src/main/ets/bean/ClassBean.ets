import { FunctionBean } from './FunctionBean'

export class ClassBean {
  id: number = 0
  className: string = ''
  title?: string
  functionNameList: Array<FunctionBean> = []

  constructor(id: number, className: string, title: string, functionNameList: Array<FunctionBean>) {
    this.id = id
    this.className = className
    this.title = title
    this.functionNameList = functionNameList
  }
}
 
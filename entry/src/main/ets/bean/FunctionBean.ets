export class FunctionBean {
  parentId: number = 0
  parentName: string = ""
  id: number = 0
  functionName: string = ''
  toastMessage?: string

  constructor(parentId: number, parentName: string, id: number, functionName: string, toastMessage?: string) {
    this.parentId = parentId
    this.parentName = parentName
    this.id = id
    this.functionName = functionName
    this.toastMessage = toastMessage
  }
}
 
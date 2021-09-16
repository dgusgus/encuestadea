<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/comun/cabecera.html"/>
<div class="col-xs-12">
	<h2>Lista de Consultas Estudiantiles</h2>

	<div id="tabla">
		<div class="row">
			<div class="col-xs-12">
				<h3 class="header smaller lighter blue">jQuery dataTables</h3>

				<div class="clearfix">
					<div class="pull-right tableTools-container"></div>
				</div>
				<div class="table-header">
					Results for "Latest Registered Domains"
				</div>

				<!-- div.table-responsive -->

				<!-- div.dataTables_borderWrap -->
				<div>
					<table id="dynamic-table" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</th>
								<th>Domain</th>
								<th>Price</th>
								<th class="hidden-480">Clicks</th>

								<th>
									<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
									Update
								</th>
								<th class="hidden-480">Status</th>

								<th></th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">app.com</a>
								</td>
								<td>$45</td>
								<td class="hidden-480">3,330</td>
								<td>Feb 12</td>

								<td class="hidden-480">
									<span class="label label-sm label-warning">Expiring</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">base.com</a>
								</td>
								<td>$35</td>
								<td class="hidden-480">2,595</td>
								<td>Feb 18</td>

								<td class="hidden-480">
									<span class="label label-sm label-success">Registered</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">max.com</a>
								</td>
								<td>$60</td>
								<td class="hidden-480">4,400</td>
								<td>Mar 11</td>

								<td class="hidden-480">
									<span class="label label-sm label-warning">Expiring</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">best.com</a>
								</td>
								<td>$75</td>
								<td class="hidden-480">6,500</td>
								<td>Apr 03</td>

								<td class="hidden-480">
									<span class="label label-sm label-inverse arrowed-in">Flagged</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">pro.com</a>
								</td>
								<td>$55</td>
								<td class="hidden-480">4,250</td>
								<td>Jan 21</td>

								<td class="hidden-480">
									<span class="label label-sm label-success">Registered</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">team.com</a>
								</td>
								<td>$40</td>
								<td class="hidden-480">3,200</td>
								<td>Feb 09</td>

								<td class="hidden-480">
									<span class="label label-sm label-inverse arrowed-in">Flagged</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">up.com</a>
								</td>
								<td>$95</td>
								<td class="hidden-480">8,520</td>
								<td>Feb 22</td>

								<td class="hidden-480">
									<span class="label label-sm label-info arrowed arrowed-righ">Sold</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">view.com</a>
								</td>
								<td>$45</td>
								<td class="hidden-480">4,100</td>
								<td>Mar 12</td>

								<td class="hidden-480">
									<span class="label label-sm label-success">Registered</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">nice.com</a>
								</td>
								<td>$38</td>
								<td class="hidden-480">3,940</td>
								<td>Feb 12</td>

								<td class="hidden-480">
									<span class="label label-sm label-info arrowed arrowed-righ">Sold</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">fine.com</a>
								</td>
								<td>$25</td>
								<td class="hidden-480">2,983</td>
								<td>Apr 01</td>

								<td class="hidden-480">
									<span class="label label-sm label-warning">Expiring</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">good.com</a>
								</td>
								<td>$50</td>
								<td class="hidden-480">6,500</td>
								<td>Feb 02</td>

								<td class="hidden-480">
									<span class="label label-sm label-inverse arrowed-in">Flagged</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">great.com</a>
								</td>
								<td>$55</td>
								<td class="hidden-480">6,400</td>
								<td>Feb 24</td>

								<td class="hidden-480">
									<span class="label label-sm label-success">Registered</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">shine.com</a>
								</td>
								<td>$25</td>
								<td class="hidden-480">2,200</td>
								<td>Apr 01</td>

								<td class="hidden-480">
									<span class="label label-sm label-inverse arrowed-in">Flagged</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">rise.com</a>
								</td>
								<td>$42</td>
								<td class="hidden-480">3,900</td>
								<td>Feb 01</td>

								<td class="hidden-480">
									<span class="label label-sm label-info arrowed arrowed-righ">Sold</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">above.com</a>
								</td>
								<td>$35</td>
								<td class="hidden-480">3,420</td>
								<td>Mar 12</td>

								<td class="hidden-480">
									<span class="label label-sm label-warning">Expiring</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">share.com</a>
								</td>
								<td>$30</td>
								<td class="hidden-480">3,200</td>
								<td>Feb 11</td>

								<td class="hidden-480">
									<span class="label label-sm label-info arrowed arrowed-righ">Sold</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">fair.com</a>
								</td>
								<td>$35</td>
								<td class="hidden-480">3,900</td>
								<td>Mar 26</td>

								<td class="hidden-480">
									<span class="label label-sm label-inverse arrowed-in">Flagged</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">year.com</a>
								</td>
								<td>$48</td>
								<td class="hidden-480">3,990</td>
								<td>Feb 15</td>

								<td class="hidden-480">
									<span class="label label-sm label-warning">Expiring</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">day.com</a>
								</td>
								<td>$55</td>
								<td class="hidden-480">5,600</td>
								<td>Jan 29</td>

								<td class="hidden-480">
									<span class="label label-sm label-info arrowed arrowed-righ">Sold</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">light.com</a>
								</td>
								<td>$40</td>
								<td class="hidden-480">3,100</td>
								<td>Feb 17</td>

								<td class="hidden-480">
									<span class="label label-sm label-success">Registered</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">sight.com</a>
								</td>
								<td>$58</td>
								<td class="hidden-480">6,100</td>
								<td>Feb 19</td>

								<td class="hidden-480">
									<span class="label label-sm label-inverse arrowed-in">Flagged</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">right.com</a>
								</td>
								<td>$50</td>
								<td class="hidden-480">4,400</td>
								<td>Apr 01</td>

								<td class="hidden-480">
									<span class="label label-sm label-warning">Expiring</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">once.com</a>
								</td>
								<td>$20</td>
								<td class="hidden-480">1,400</td>
								<td>Apr 04</td>

								<td class="hidden-480">
									<span class="label label-sm label-info arrowed arrowed-righ">Sold</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
														<span class="blue">
															<i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div><!-- /.col -->
<sec:authorize access="isAuthenticated()">
	<script type="text/javascript">
		$(function () {
			//initiate dataTables plugin
			var oTable1 =
				$('#dynamic-table')
				//.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
				.dataTable({
					bAutoWidth: false,
					"aoColumns": [
						{"bSortable": false},
						null, null, null, null, null,
						{"bSortable": false}
					],
					"aaSorting": [],
					"language": {
						"url": "assets/js/dataTables/Spanish.json"
					},


					//,
					//"sScrollY": "200px",
					//"bPaginate": false,

					//"sScrollX": "100%",
					//"sScrollXInner": "120%",
					//"bScrollCollapse": true,
					//Note: if you are applying horizontal scrolling (sScrollX) on a ".table-bordered"
					//you may want to wrap the table inside a "div.dataTables_borderWrap" element

					//"iDisplayLength": 50
				});
		});
	</script>
</sec:authorize>
<jsp:include page="/comun/pie.html"/>